package manager;

import model.ReturnTuple;
import model.User;

import java.sql.*;

public class DBConnection {
    enum TB_USERS{
    id,FULLNAME,USERNAME;
    }

    private  String jdbcDriverStr = "com.mysql.jdbc.Driver";
    private  String jdbcURL = "jdbc:mysql://localhost:3306/realTimeChat";

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;

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
            String sqlStatement = String.format("INSERT INTO TB_USERS values (default, '%s','%s','%s');",usr.getFullName(),usr.getEmail(),usr.getPassword());
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

        try {
            startConnection();
            String sqlStatement = String.format("Select id, fullName from TB_USERS where email='%s' and password='%s';",usr.getEmail(),usr.getPassword());
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlStatement);
            values = getUserData(resultSet);
            System.out.print("userID: " + values.getId());
            System.out.print("userFullName: " + values.getFullName());
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

    private ReturnTuple getUserData(ResultSet resultSet) throws Exception {
        ReturnTuple values = new ReturnTuple(false,null,"");

        while(resultSet.next()){
            Integer id = resultSet.getInt(TB_USERS.id.toString());
            String fullName = resultSet.getString(TB_USERS.FULLNAME.toString());
            String username = resultSet.getString(TB_USERS.USERNAME.toString());

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