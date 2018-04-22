package handler;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.DBConnection;
import model.ReturnFileUploadData;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * A Java servlet that handles file upload from client.
 *
 * @author www.codejava.net
 */
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // location to store file uploaded
    private String UPLOAD_DIRECTORY = "upload";
            String USER_ID = "";

    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    private FileItem profilePhoto;

    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            System.out.print("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        System.out.println("Form is correct.");

        ReturnFileUploadData values = parseMultipartForm(request);

        if (values.getResponse()){
            System.out.println("parsing done.");

            String path = savePhoto(values.getId(),values.getPhotoItem());

            DBConnection dbConnection = new DBConnection();
            dbConnection.savePhoto(values, path);
            // redirects client to message page
            getServletContext().getRequestDispatcher("/index.jsp").forward(
                    request, response);
        } else {
            System.out.println("parsing failed.");
        }
    }

    public String savePhoto(String userID, FileItem item){
        System.out.println("save Photo");

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("") + File.separator  + UPLOAD_DIRECTORY + File.separator + userID;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
            System.out.println("dir not exist. Created. " + uploadPath);
        }

        String fileName = new File(item.getName()).getName();
        String filePath = uploadPath + File.separator + fileName;
        File storeFile = new File(filePath);

        // saves the file on disk
        try {
            item.write(storeFile);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("There was an error: " + e.getMessage());
            return null;
        }
        System.out.print("Upload has been done successfully!" + filePath);
        return UPLOAD_DIRECTORY + File.separator + userID + File.separator + fileName;
    }

    public ReturnFileUploadData parseMultipartForm(HttpServletRequest request){
        System.out.println("parse Multipart form");
        ReturnFileUploadData returnValues = new ReturnFileUploadData();
        returnValues.setResponse(true);

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        returnValues.setPhotoItem(item);
                    } else {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).

                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("UTF-8");
                        if (fieldName.equals("userID")) {
                            returnValues.setId(fieldValue);
                            System.out.println("--------" + fieldValue);
                        } else if (fieldName.equals("email")) {
                            returnValues.setEmail(fieldValue);
                            System.out.println("--------" + fieldValue);
                        } else if (fieldName.equals("fullName")){
                            returnValues.setFullName(fieldValue);
                            System.out.println("--------" + fieldValue);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            returnValues.setResponse(false);
            System.out.print("There was an error: " + ex.getMessage());
        }
        return returnValues;
    }
}