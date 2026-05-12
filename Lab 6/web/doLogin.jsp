<%-- 
    Document   : doLogin
    Created on : May 12, 2026, 8:16:34 PM
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%
            String username = request.getParameter("Username");
            String password = request.getParameter("Password");
            
            Class.forName("com.mysql.jdbc.Driver");

            String query = "SELECT * FROM userprofile WHERE username = ? AND password = ?";
            ResultSet rs = null;
               
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
                PreparedStatement pstmt = con.prepareStatement(query)) {

                pstmt.setString(1, username);
                pstmt.setString(2, password);
                
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                    session.setAttribute("username", username);
                    session.setAttribute("firstName", rs.getString("firstName"));
                    session.setAttribute("lastName", rs.getString("lastName"));
                    response.sendRedirect("main.jsp");
                } else {
                    out.println("<p style='color:red'>Invalid username or password!</p>");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error message" + e);
            }
      
        %>
    </body>
</html>
