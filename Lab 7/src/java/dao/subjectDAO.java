package dao;

import bean.subjectBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class subjectDAO {
    
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Ensure the password matches your local XAMPP setup ("root" with "" or "admin")
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "admin");
    }
    
    // CREATE
    public boolean registerSubject(subjectBean subject) {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject.getMatric_no());
            ps.setString(2, subject.getSubject_code());
            ps.setString(3, subject.getSubject_name());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // READ (Fetch items belonging exclusively to the active user session)
    public List<subjectBean> getSubjectsByMatric(String matricNo) {
        List<subjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, matricNo);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    subjectBean sub = new subjectBean();
                    sub.setId(rs.getInt("id"));
                    sub.setMatric_no(rs.getString("matric_no"));
                    sub.setSubject_code(rs.getString("subject_code"));
                    sub.setSubject_name(rs.getString("subject_name"));
                    list.add(sub);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ SINGLE (For populating the update screen inputs)
    public subjectBean getSubjectById(int id) {
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    subjectBean sub = new subjectBean();
                    sub.setId(rs.getInt("id"));
                    sub.setMatric_no(rs.getString("matric_no"));
                    sub.setSubject_code(rs.getString("subject_code"));
                    sub.setSubject_name(rs.getString("subject_name"));
                    return sub;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // UPDATE
    // Locate this method in subjectDAO.java and ensure it matches this exactly:
    public boolean updateSubject(subjectBean subject) {
        // Crucial check: make sure your table columns are spelled exactly subject_name and subject_code
        String sql = "UPDATE registered_subjects SET subject_name = ?, subject_code = ? WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, subject.getSubject_name());
            ps.setString(2, subject.getSubject_code());
            ps.setInt(3, subject.getId());
            ps.setString(4, subject.getMatric_no());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // DELETE
    public boolean deleteSubject(int id, String matricNo) {
        String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setString(2, matricNo);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}