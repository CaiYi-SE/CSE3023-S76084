/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Asus
 */

import bean.StudentBean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

public class StudentDAO {
    private Connection getConnection() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "admin");
    }
    
    public boolean registerStudent(StudentBean student, InputStream imageStream){
        try(Connection conn = getConnection()){
            String sql = "insert into students (matric_no, password, fullname, profile_image) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, student.getMatricNo());
            ps.setString(2, student.getPassword());
            ps.setString(3, student.getFullname());
            ps.setBlob(4, imageStream); // Set BLOB data
            
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    // --- LOGIN LOGIC ---
    public StudentBean loginStudent(String matricNo, String password) {
        StudentBean student = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM students WHERE matric_no = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matricNo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                student = new StudentBean();
                student.setMatricNo(rs.getString("matric_no"));
                student.setFullname(rs.getString("fullname"));
                
                // Fetch BLOB and convert to Base64 String
                Blob blob = rs.getBlob("profile_image");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    student.setBase64Image(Base64.getEncoder().encodeToString(imageBytes));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }
    
    // --- DELETE LOGIC ---
    public boolean deleteStudent(String matricNo) {
        try (Connection conn = getConnection()) {
            String sql = "DELETE FROM students WHERE matric_no = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, matricNo);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
