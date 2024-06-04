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
        this("jdbc:sqlserver://localhost:1433;databaseName= swp_iter1;encrypt=false", "sa", "123");
    }
}
