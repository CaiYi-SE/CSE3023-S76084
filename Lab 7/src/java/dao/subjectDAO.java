/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Asus
 */

import bean.subjectBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class subjectDAO {
    private Connection getConnection() throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "admin");
    }
    
    public boolean registerSubject(subjectBean subject){
        try(Connection conn = getConnection()){
            String sql = "insert into registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, subject.getMatric_no());
            ps.setString(2, subject.getSubject_code());
            ps.setString(3, subject.getSubject_name());
            
            return ps.executeUpdate()>0;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateSubject(String subjectCode){
        try (Connection conn = getConnection()) {
            String sql = "UPDATE registered_subjects SET subject_name = ?, subject_code = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, subjectCode);
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // --- DELETE LOGIC ---
    public boolean deleteSubject(String subjectCode) {
        try (Connection conn = getConnection()) {
            String sql = "DELETE FROM registered_subjects WHERE subject_code = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, subjectCode);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
