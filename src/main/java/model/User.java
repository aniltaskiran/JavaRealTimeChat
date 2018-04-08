package model;

public class User {
    String username;
    String password;
    String email;
    String lastName;
    String firstName;

    public User(String username, String password, String email, String lastName, String firstName){
        this.username = username;
        this.password = password;
        this.email = email;
        this.lastName = lastName;
        this.firstName = firstName;
    }
    public User(String username, String password){
        this.username = username;
        this.password = password;
    }
    public User(){
    }

    public String getUsername(){
        return username;
    }
    public String getPassword(){
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setUsername(String username){
        this.username = username;
    }
    public void setPassword(String password){
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
