package websocket.handler;


import manager.DBConnection;
import model.ReturnUser;
import model.User;
import websocket.model.Message;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;



@ServerEndpoint(value = "/chat/{username}", decoders = MessageDecoder.class, encoders = MessageEncoder.class)
public class ChatEndpoint {
    private Session session;
    private static final Set<ChatEndpoint> chatEndpoints = new CopyOnWriteArraySet<>();
    private static HashMap<String, String> users = new HashMap<>();
    private static HashMap<String, String> userToUserID = new HashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) throws IOException, EncodeException {


        this.session = session;
        chatEndpoints.add(this);
        users.put(session.getId(), username);
        System.out.print("username is: " + username);

        Message message = new Message();
        broadcast(message);
    }

    @OnMessage
    public void onMessage(Session session, Message message) throws IOException, EncodeException {
        message.setFrom(users.get(session.getId()));
        String type = (String) message.getType();
        if (type.equals("addNewUser")){

            DateFormat sdf = new SimpleDateFormat("HH:mm");
            Date date = new Date();
            System.out.println(sdf.format(date));

            message.setLoginTime(sdf.format(date));
            User usr = new User(Integer.parseInt(message.getSenderID()),message.getFrom());
            addOnlineUser(usr);
            userToUserID.put(session.getId(), (String.valueOf(usr.getUserID())));
            message.setPath(getProfilePhoto(message.getSenderID()).getPath());
        }
        broadcast(message);
    }

    public void addOnlineUser(User usr){
        DBConnection dao = new DBConnection();
        dao.addOnlineUser(usr);
    }
    public void removeOnlineUser(Session session){
        DBConnection dao = new DBConnection();
        dao.removeOnlineUser(userToUserID.get(session.getId()));
    }
    public ReturnUser getProfilePhoto(String userID){
        DBConnection dao = new DBConnection();
        return dao.getProfilePhotoWithUserID(userID);
    }

    @OnClose
    public void onClose(Session session) throws IOException, EncodeException {
        chatEndpoints.remove(this);

        removeOnlineUser(session);
        Message message = new Message();
        message.setFrom(users.get(session.getId()));
        message.setType("deleteUser");
        message.setSenderID(userToUserID.get(session.getId()));
        message.setContent("Disconnected!");
        broadcast(message);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }

    private static void broadcast(Message message) throws IOException, EncodeException {
        chatEndpoints.forEach(endpoint -> {
            synchronized (endpoint) {
                try {
                    endpoint.session.getBasicRemote()
                            .sendObject(message);
                } catch (IOException | EncodeException e) {
                    e.printStackTrace();
                }
            }
        });
    }

}
