package handler;

import com.google.gson.Gson;
import manager.DBConnection;
import manager.JsonResponse;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/registration"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        User usr = gson.fromJson(req.getReader(), User.class);
        System.out.print(usr.getEmail() + usr.getPassword() + usr.getFullName());

        DBConnection dao = new DBConnection();
        try {
            JsonResponse jsonResp = new JsonResponse(resp);
            jsonResp.sendResponse(dao.registerUser(usr));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
