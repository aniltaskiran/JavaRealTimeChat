package model;

public class ReturnUser {
    Boolean response;
    String id;
    String fullName;
    String path;

    public ReturnUser(Boolean response, String id, String fullName){
        this.response = response;
        this.id = id;
        this.fullName = fullName;
    }
    public ReturnUser(Boolean response){
        this.response = response;
        this.id = "0";
    }
    public ReturnUser(Boolean response, String id, String fullName, String path){
        this.response = response;
        this.id = id;
        this.fullName = fullName;
        this.path = path;
    }



    public String getFullName() {
        return fullName;
    }

    public Boolean getResponse() {
        return response;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setResponse(Boolean response) {
        this.response = response;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

}
