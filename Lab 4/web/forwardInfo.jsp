<%-- 
    Document   : forwardInfo
    Created on : 21 Apr 2026, 2:08:22 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:forward to display user information</h1>
            <%
                String name = request.getParameter("uname");
                String email = request.getParameter("email");
                String nationality = request.getParameter("nationality");
                String background = request.getParameter("background");
            %>
            <div class="card">
                <p class="form-title">Forwarded Info</p>
                <p>Name: <%= name %></p>
                <p>Email: <%= email %></p>
                <p>Nationality: <%= nationality %></p>
                <p>Background: <%= background %></p>
            </div>
        </div>
    </body>
</html>
