package model;

import org.apache.commons.fileupload.FileItem;

public class ReturnFileUploadData {
    Boolean response;
    String id;
    String email;
    FileItem photoItem;
    String fullName;

public ReturnFileUploadData(){
    this.response = false;
    this.id = "";
    this.email = "";
    this.photoItem = null;
    this.fullName = "";
}

    public String getId() {
        return id;
    }

    public Boolean getResponse() {
        return response;
    }

    public FileItem getPhotoItem() {
        return photoItem;
    }

    public void setResponse(Boolean response) {
        this.response = response;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPhotoItem(FileItem photoItem) {
        this.photoItem = photoItem;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getFullName() {
        return fullName;
    }
}
