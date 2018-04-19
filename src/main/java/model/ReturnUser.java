package model;

public class ReturnUser {
    Boolean response;
    String id;
    String fullName;

    public ReturnUser(Boolean response, String id, String fullName){
        this.response = response;
        this.id = id;
        this.fullName = fullName;
    }
    public ReturnUser(Boolean response){
        this.response = response;
        this.id = "0";
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
}
