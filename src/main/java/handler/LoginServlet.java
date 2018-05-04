package handler;


import com.google.gson.Gson;
import manager.DBConnection;
import manager.JsonResponse;
import model.ReturnUser;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "login", urlPatterns = {"/login"})

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        System.out.print(req.getContentType());
        User usr;

        if (req.getContentType().equals("application/json; charset=UTF-8") || req.getContentType().equals("application/json")){
            usr = gson.fromJson(req.getReader(), User.class);
            apiResponse(resp,usr);
        } else {
            String email = req.getParameter("email");
            String password = req.getParameter("pass");
            usr = new User(email, password);
            webPageResponse(resp,req,usr);
        }
    }

    public void webPageResponse(HttpServletResponse resp, HttpServletRequest req, User usr) throws ServletException, IOException {

        DBConnection dao = new DBConnection();
        try {
            ReturnUser result = dao.loginAccountControl(usr);
            req.setAttribute("result", result.getResponse());

            Cookie userID = new Cookie("userID", result.getId());
            //seconds
            userID.setMaxAge(60*60*24*30);
            resp.addCookie(userID);

            dao.saveIPAddr(req.getRemoteAddr(),result.getId());

            System.out.println("\nemail " + usr.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
        rd.forward(req, resp);
    }

    public void apiResponse(HttpServletResponse resp, User usr){

        DBConnection dao = new DBConnection();
        try {
            JsonResponse jsonResp = new JsonResponse(resp);
            jsonResp.sendResponse(dao.loginAccountControl(usr));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
