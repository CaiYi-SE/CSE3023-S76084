/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Car;
import dao.CarDAO;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;

@WebServlet("/")
public class CarServlet extends HttpServlet {
    
    private CarDAO carDAO;
    
    @Override
    public void init() {
        carDAO = new CarDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        
        try {
            switch (action) {
                case "/list":       
                case "/":           
                    listCar(request, response);
                    break;
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCar(request, response);
                    break;
                case "/delete":
                    deleteCar(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateCar(request, response);
                    break;
                default:
                    listCar(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void listCar(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
        List<Car> listCar = carDAO.selectAllCars();
        request.setAttribute("list", listCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarList.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        Car existingCar = carDAO.selectCar(carId);
        
        request.setAttribute("car", existingCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        dispatcher.forward(request, response);
    }
    
    private void insertCar(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
        String brand = request.getParameter("Brand");
        String model = request.getParameter("Model");
        
        int cylinder = Integer.parseInt(request.getParameter("Cyclinder")); 
        double price = Double.parseDouble(request.getParameter("Price"));
        
        Car newCar = new Car(brand, model, cylinder, price);
        carDAO.insertCar(newCar);
        
        response.sendRedirect(request.getContextPath() + "/");
    }
    
    private void updateCar(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        String brand = request.getParameter("Brand");
        String model = request.getParameter("Model");
        int cylinder = Integer.parseInt(request.getParameter("Cyclinder"));
        double price = Double.parseDouble(request.getParameter("Price"));
        
        Car car = new Car(carId, brand, model, cylinder, price);
        carDAO.updateCar(car);
        
        response.sendRedirect(request.getContextPath() + "/");
    }
    
    private void deleteCar(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        carDAO.deleteCar(carId);
        
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}