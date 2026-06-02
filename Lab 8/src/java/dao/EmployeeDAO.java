/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Employee;

public class EmployeeDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/company";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_EMPLOYEES_SQL = "INSERT INTO employees (name, email, position) VALUES " + "(?, ?, ?);";
    
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT id, name, email, position FROM employees WHERE id = ?";
    
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees";
    
    private static final String DELETE_EMPLOYEES_SQL = "DELETE FROM employees WHERE id = ?;";
    
    private static final String UPDATE_EMPLOYEES_SQL = "UPDATE employees SET name = ?, email= ?, position = ? where id = ?;";
    
    public EmployeeDAO(){
        
    }
    
    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertEmployee(Employee employee) throws SQLException{
        System.out.println(INSERT_EMPLOYEES_SQL);
        
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT_EMPLOYEES_SQL)){
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPosition());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e){
            printSQLException(e);
        }
    }
        
    public Employee selectEmployee(int id) {
        Employee employee = null;
        // Step 1: Establishing a Connection
        try (Connection con = getConnection();
                
            // Step 2: Create a statement using connection object
            PreparedStatement ps = con.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            ps.setInt(1, id);
            System.out.println(ps);
            
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();
            
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employee = new Employee(id, name, email, position);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }
    
    public List<Employee> selectAllEmployees(){
        List<Employee> employees = new ArrayList<>();
        
        try(Connection con = getConnection();
                
            PreparedStatement ps = con.prepareStatement(SELECT_ALL_EMPLOYEES);){
            System.out.println(ps);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employees.add(new Employee(id, name, email, position));
            }
            
        } catch (SQLException e){
            printSQLException(e);
        }
        return employees;
    }
    
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(DELETE_EMPLOYEES_SQL);) {
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateEmployee(Employee employee) throws SQLException{
        boolean rowUpdated;
        try(Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(UPDATE_EMPLOYEES_SQL);){
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPosition());
            ps.setInt(4, employee.getId());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex){
        for(Throwable e: ex){
            if(e instanceof SQLException){
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException)e).getSQLState());
                System.err.println("Error Code: " + ((SQLException)e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                
                Throwable t = ex.getCause();
                
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
