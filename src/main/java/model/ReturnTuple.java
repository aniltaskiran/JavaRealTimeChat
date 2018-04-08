package model;

public class ReturnTuple {
    Boolean response;
    String id;
    String fullname;

    public ReturnTuple(Boolean response, String id, String fullname){
        this.response = response;
        this.id = id;
        this.fullname = fullname;
    }
    public ReturnTuple(Boolean response){
        this.response = response;
        this.id = "0";
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Boolean getResponse() {
        return response;
    }

    public String getId() {
        return id;
    }

    public void setResponse(Boolean response) {
        this.response = response;
    }

    public void setId(String id) {
        this.id = id;
    }
}
