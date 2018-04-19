package manager;

import model.ReturnHashMap;
import model.ReturnUser;
import model.User;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class DBConnection {
    enum TB_USERS{
        ID,FULLNAME,EMAIL;
    }
    enum TB_ONLINE_USERS{
        ID,FULLNAME,LOGINTIME;
    }
    private  String jdbcDriverStr = "com.mysql.jdbc.Driver";
    private  String jdbcURL = "jdbc:mysql://localhost:3306/realTimeChat";
    private  String localHostUser = "root";
    private  String localHostPassword = "";
    private  String remoteHostUser = "kev";
    private  String remoteHostPassword = "a8f38f726da3c612cf9dfd0a2aa686425c6919367b0bf6c2";

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;

    private void startConnection(){
        try {
            Class.forName(jdbcDriverStr);
            connection = DriverManager.getConnection(jdbcURL,localHostUser,localHostPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Boolean registerUser(User usr){
        try {
            startConnection();
            String sqlStatement = String.format("INSERT INTO TB_USERS values (default, '%s','%s','%s');",usr.getFullName(),usr.getEmail(),usr.getPassword());
            statement = connection.createStatement();
            statement.executeUpdate(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return false;
        } finally{
            close();
        }
        return true;
    }
    public Boolean addOnlineUser(User usr){
        DateFormat sdf = new SimpleDateFormat("HH:mm");
        java.util.Date date = new Date();
        System.out.println(sdf.format(date));

        try {
            startConnection();
            String sqlStatement = String.format("INSERT INTO TB_ONLINE_USERS values ('%s','%s','%s');",usr.getUserID(),usr.getFullName(),sdf.format(date).toString());
            statement = connection.createStatement();
            statement.executeUpdate(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return false;
        } finally{
            close();
        }
        return true;
    }
    public Boolean removeOnlineUser(String id){
        try {
            startConnection();
            String sqlStatement = String.format("DELETE FROM TB_ONLINE_USERS WHERE ID=%s;",id);
            statement = connection.createStatement();
            statement.executeUpdate(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return false;
        } finally{
            close();
        }
        return true;
    }

    public ReturnHashMap getOnlineUsers(){

        HashMap<String, String> iDToName = new HashMap<>();
        HashMap<String, String> iDToLoginTime = new HashMap<>();

        try {
            startConnection();
            String sqlStatement = String.format("Select * from TB_ONLINE_USERS;");
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlStatement);

            while(resultSet.next()){
                Integer id = resultSet.getInt(TB_ONLINE_USERS.ID.toString());
                String fullName = resultSet.getString(TB_ONLINE_USERS.FULLNAME.toString());
                String loginTime = resultSet.getString(TB_ONLINE_USERS.LOGINTIME.toString());
                iDToName.put(id.toString(),fullName);
                iDToLoginTime.put(id.toString(),loginTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        } catch (Exception e) {
            e.printStackTrace();

        } finally{
            close();
        }
        ReturnHashMap values = new ReturnHashMap();
        values.setIdToLoginTime(iDToLoginTime);
        values.setiDToName(iDToName);
        return values;
    }


    public ReturnUser loginAccountControl(User usr) {
        ReturnUser values = new ReturnUser(false, null,"");

        try {
            startConnection();
            String sqlStatement = String.format("Select id, fullName from TB_USERS where email='%s' and password='%s';",usr.getEmail(),usr.getPassword());
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlStatement);
            values = getUserData(resultSet);
            System.out.print("userID: " + values.getId());
            System.out.print("userFullName: " + values.getFullName());
        } catch (SQLException e) {
            e.printStackTrace();
            values.setId(null);
            values.setResponse(false);

        } catch (Exception e) {
            values.setId(null);
            values.setResponse(false);
            e.printStackTrace();

        } finally{
            close();
        }
        values.setResponse(true);

        if (values.getId() == null){
            values.setId(null);
            values.setResponse(false);
        }

        return values;
    }

    private ReturnUser getUserData(ResultSet resultSet) throws Exception {
        ReturnUser values = new ReturnUser(false,null,"");

        while(resultSet.next()){
            Integer id = resultSet.getInt(TB_USERS.ID.toString());
            String fullName = resultSet.getString(TB_USERS.FULLNAME.toString());

            values = new ReturnUser(true,id.toString(),fullName);
            return values;
        }
        return values;
    }


    private void close(){
        try {
            if(resultSet!=null) resultSet.close();
            if(statement!=null) statement.close();
            if(connection!=null) connection.close();
        } catch(Exception e){}
    }
}