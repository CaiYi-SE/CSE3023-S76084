/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab6.com;

/**
 *
 * @author Asus
 */
import java.sql.*;

public class Database {
    private static Connection conn = null;
    private static String myURL = "jdbc:mysql://localhost:3306/cse3023";
    private int result = 0;
    
    public static Connection getConnection() throws ClassNotFoundException {
        
        if(conn != null) {
            return conn;
        } else try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(myURL, "root", "admin");
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        
        return conn;
    }
    
    public void closeConnection () throws ClassNotFoundException{
        try {
            conn.close();
        } 
        catch (SQLException e){
            e.printStackTrace();
        }
    }
}
