package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect{
    Connection conn = null;
    public DBConnect(String url, String username, String password){
        //driver
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //connection
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e.getMessage());

        }
    }
    
    public DBConnect(){
        this("jdbc:sqlserver://localhost:1433;databaseName= SWP_G1_V2;encrypt=false", "sa", "123456");
    }

    public static void main(String[] args) {
        DBConnect db = new DBConnect();
        if(db.conn != null){
            System.out.println("Connected");
        } else {
            System.out.println("Not connected");
        }
    }
}
