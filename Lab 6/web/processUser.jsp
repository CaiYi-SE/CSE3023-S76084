<%-- 
    Document   : processUser
    Created on : May 12, 2026, 7:24:29 PM
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
            String firstName = request.getParameter("FirstName");
            String lastName = request.getParameter("LastName");
           
            Class.forName("com.mysql.jdbc.Driver");

            String query = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
               
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
                PreparedStatement pstmt = con.prepareStatement(query)) {

                pstmt.setString(1, username);
                pstmt.setString(2, password);
                pstmt.setString(3, firstName);
                pstmt.setString(4, lastName);
                
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error message" + e);
            }
        %>
        
        <div>
            <h1>Processing User Information</h1>
            
            <p>Username: <%= username%></p>
            <p>Password: <%= password%></p>
            <p>First Name: <%= firstName%></p>
            <p>Last Name: <%= lastName%></p>
            
            <button><a href="login.jsp"/>Go to Login</button>
        </div>
    </body>
</html>
