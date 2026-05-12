<%-- 
    Document   : main
    Created on : May 12, 2026, 7:56:03 PM
    Author     : Asus
--%>

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
            String username = (String) session.getAttribute("username");
            String firstName = (String) session.getAttribute("firstName");
            String lastName = (String) session.getAttribute("lastName");
        %>
            
        <h1>Welcome, <%= username%> !</h1>
        <p>First Name: <%= firstName%></p>
        <p>Last Name: <%= lastName%></p>
    </body>
</html>
