package manager;

import com.google.gson.JsonObject;
import model.ReturnUser;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JsonResponse {
    HttpServletResponse response;

    public JsonResponse(HttpServletResponse resp){
        this.response = resp;
    }

    public void sendResponse(ReturnUser tuple) throws IOException {
        JsonObject complaint = new JsonObject();
        complaint.addProperty("result", tuple.getResponse());
        complaint.addProperty("id", tuple.getId());
        complaint.addProperty("path", tuple.getPath());
        complaint.addProperty("fullName", tuple.getFullName());
        sendJson(complaint);
    }

    public void sendResponse(Boolean response) throws IOException {
        JsonObject complaint = new JsonObject();
        complaint.addProperty("result", response);
        sendJson(complaint);
    }

    private void sendJson(JsonObject json) throws IOException {

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        out.println(json);
        out.close();
    }
}
