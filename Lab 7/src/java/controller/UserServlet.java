/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.StudentBean;
import dao.StudentDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.PrintWriter;

/**
 *
 * @author Asus
 */
@MultipartConfig(maxFileSize = 16177215) // max 16 MB required for image upload
public class UserServlet extends HttpServlet {
    
    private StudentDAO sDAO = new StudentDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        if ("logout".equals(action)) {
            // --- 3. HANDLE LOGOUT ---
            if (session != null) {
                session.invalidate(); // Destroy session
                }
                response.sendRedirect("login.html");
            }
        else if ("delete".equals(action)) {
            // --- 4. HANDLE DELETE ACCOUNT ---
            if (session != null && session.getAttribute("loggedUser") != null) {
                StudentBean user = (StudentBean) session.getAttribute("loggedUser");
                sDAO.deleteStudent(user.getMatricNo());
                session.invalidate(); // Destroy session after account deletion
        }
            response.sendRedirect("register.html");
        }       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Read the hidden parameter to decide which action to execute
        String action = request.getParameter("action");
        if ("register".equals(action)) {
            
            // --- 1. HANDLE REGISTRATION ---
            StudentBean newStudent = new StudentBean();
            newStudent.setMatricNo(request.getParameter("matricNo"));
            newStudent.setFullname(request.getParameter("fullname"));
            newStudent.setPassword(request.getParameter("password"));
            
            InputStream inputStream = null;
            Part filePart = request.getPart("profileImage");
            
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }
            
            boolean isSuccess = sDAO.registerStudent(newStudent, inputStream);
            
            if (isSuccess) {
                response.getWriter().println("Registration Successful! <a href='login.html'>Login here</a>");
            } else {
                response.getWriter().println("Registration Failed!");
            }
            
        } else if ("login".equals(action)) {
            
            // --- 2. HANDLE LOGIN ---
            String matric = request.getParameter("matricNo");
            String pass = request.getParameter("password");
            StudentBean student = sDAO.loginStudent(matric, pass);
            
            if (student != null) {
                // Login successful: Store the entire bean in the Session
                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", student);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.getWriter().println("Invalid Credentials! <a href='login.html'>Try Again</a>");
            }
        }
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
