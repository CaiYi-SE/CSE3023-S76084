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

public class MarathonDAO {
    private Connection conn = null;
    private int result = 0;
    
    public MarathonDAO() throws ClassNotFoundException {
        conn = Database.getConnection();
    }
    
    public int addDetails (Marathon marathon) {
        try{
            String query = "INSERT INTO marathon(icno, name, category) VALUE (?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            System.out.println("IC No: " + marathon.getIcno());
            System.out.println("Name: " + marathon.getName());
            System.out.println("Category: " + marathon.getCategory());
            
            pstmt.setString(1, marathon.getIcno());
            pstmt.setString(2, marathon.getName());
            pstmt.setString(3, marathon.getCategory());
            result = pstmt.executeUpdate();
        } 
        catch (SQLException e){
            e.printStackTrace();
        }
        
        return result;
    }
}

