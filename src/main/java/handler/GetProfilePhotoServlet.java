package handler;

import com.google.gson.Gson;
import manager.DBConnection;
import manager.JsonResponse;
import model.ReturnUser;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//@WebServlet(name = "GetProfilePhoto", urlPatterns = {"/getProfilePhoto"})

public class GetProfilePhotoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        System.out.print(req.getContentType());
        User usr;
        resp.setContentType("application/json; charset=UTF-8");

        if (req.getContentType().equals("application/json; charset=UTF-8") || req.getContentType().equals("application/json")){
            usr = gson.fromJson(req.getReader(), User.class);
            apiResponse(resp,usr);
        }
    }

    public void apiResponse(HttpServletResponse resp, User usr){

        DBConnection dao = new DBConnection();
        try {
            JsonResponse jsonResp = new JsonResponse(resp);
            jsonResp.sendResponse(dao.getProfilePhoto(usr.getEmail()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
