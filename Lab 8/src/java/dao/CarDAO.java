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
import model.Car;

public class CarDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/carshop";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "admin";
    
    private static final String INSERT_CAR_SQL = "INSERT INTO carpricelist (Brand, Model, Cyclinder, Price) VALUES (?, ?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT carId, Brand, Model, Cyclinder, Price FROM carpricelist WHERE carId = ?";
    private static final String SELECT_ALL_CAR = "SELECT * FROM carpricelist";
    private static final String DELETE_CAR_SQL = "DELETE FROM carpricelist WHERE carId = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE carpricelist SET Brand = ?, Model= ?, Cyclinder = ?, Price = ? WHERE carId = ?;";
    
    public CarDAO() {}
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertCar(Car car) throws SQLException {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_CAR_SQL)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCyclinder());
            ps.setDouble(4, car.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
            throw e; 
        }
    }
        
    public Car selectCar(int carId) {
        Car car = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_CAR_BY_ID)) {
            ps.setInt(1, carId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String brand = rs.getString("Brand");
                    String model = rs.getString("Model");
                    int cylinder = rs.getInt("Cyclinder");
                    double price = rs.getDouble("Price");
                    car = new Car(carId, brand, model, cylinder, price);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return car;
    }
    
    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL_CAR);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("carId");
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cylinder = rs.getInt("Cyclinder");
                double price = rs.getDouble("Price");
                cars.add(new Car(id, brand, model, cylinder, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cars;
    }
    
    public boolean deleteCar(int carId) throws SQLException {
        boolean rowDeleted;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_CAR_SQL)) {
            ps.setInt(1, carId);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_CAR_SQL)) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCyclinder());
            ps.setDouble(4, car.getPrice());
            ps.setInt(5, car.getCarId());
            
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
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