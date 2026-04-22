<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 3:40:13 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Result</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>BMI Result</h1>
        
        <%
            double weight = Double.parseDouble(request.getParameter("weight"));
            double height = Double.parseDouble(request.getParameter("height"));
            double bmi = Double.parseDouble(request.getParameter("bmi"));
            String category = request.getParameter("category");
        %>
        <p> Weight = <%= String.format("%.2f", weight) %> kg</p>
        <p> Height = <%= String.format("%.2f", height) %> m</p>
        <p> BMI = <%= String.format("%.2f", bmi) %> </p>
        <p> Category = <%= category %></p>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
