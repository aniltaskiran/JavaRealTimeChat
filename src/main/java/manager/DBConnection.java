package manager;

import model.ReturnTuple;
import model.User;

import java.sql.*;

public class DBConnection {
    enum TB_USERS{
    id,FULLNAME;
}

    private  String jdbcDriverStr = "com.mysql.jdbc.Driver";
    private  String jdbcURL = "jdbc:mysql://localhost:3306/realTimeChat";

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;

    public DBConnection(){

    }

    private void startConnection(){
        try {
            Class.forName(jdbcDriverStr);
            connection = DriverManager.getConnection(jdbcURL,"root","");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Boolean registerUser(User usr){
        try {
            startConnection();
            String sqlStatement = String.format("INSERT INTO TB_USERS values (default, '%s','%s','%s','%s','%s');",usr.getUsername(),usr.getPassword(),usr.getEmail(),usr.getFirstName(),usr.getLastName());
            statement = connection.createStatement();
            statement.executeUpdate(sqlStatement);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return false;
        } finally{
            close();
        }
        return true;
    }

    public ReturnTuple loginAccountControl(User usr) {
        ReturnTuple values = new ReturnTuple(false, null,"");

        String userID;
        try {
            startConnection();
            String sqlStatement = String.format("Select id, CONCAT(firstName, \" \", lastName) AS FULLNAME from TB_USERS where username='%s' and password='%s';",usr.getUsername(),usr.getPassword());
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlStatement);
            values = getUserID(resultSet);
            System.out.print("userID: " + values.getId());
            System.out.print("username: " + values.getFullname());
        } catch (SQLException e) {
            e.printStackTrace();
            values.setId("null");
            values.setResponse(false);

        } catch (Exception e) {
            values.setId("null");
            values.setResponse(false);
            e.printStackTrace();

        } finally{
            close();
        }
        values.setResponse(true);

        if (values.getId() == null){
            values.setId("null");
            values.setResponse(false);
        }

        return values;
    }

    private ReturnTuple getUserID(ResultSet resultSet) throws Exception {
        ReturnTuple values = new ReturnTuple(false,null,"");

        while(resultSet.next()){
            Integer id = resultSet.getInt(TB_USERS.id.toString());
            String fullName = resultSet.getString(TB_USERS.FULLNAME.toString());
            values = new ReturnTuple(true,id.toString(),fullName);
            return values;
        }
        return values;
    }


    private void close(){
        try {
            if(resultSet!=null) resultSet.close();
            if(statement!=null) statement.close();
            if(connection!=null) connection.close();
        } catch(Exception e){}
    }
}