package model;

public class User {
    String password;
    String email;
    String fullName;
    int userID;

    public User(String password, String email, String fullName){
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }
    public User(String email, String password){
        this.email = email;
        this.password = password;
    }
    public User(int ID, String fullName){
        this.userID = ID;
        this.fullName = fullName;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
