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
        }
    }
    
    public DBConnect(){
        this("jdbc:sqlserver://localhost:1433;databaseName= SWP_G1_V2;encrypt=false", "sa", "12345678");
    }

    public static void main(String[] args) {
        new DBConnect();
        System.out.println("Connected");
    }
}
