<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 3:32:38 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculator</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>BMI Calculator</h1>
        
        <%
            double weight = Double.parseDouble(request.getParameter("weight"));
            double height = Double.parseDouble(request.getParameter("height"));
            
            double bmi = weight / (height * height);
            
            String category;

            if (bmi < 18.5) {
                category = "Underweight";
            } else if (bmi <= 25) {
                category = "Normal";
            } else {
                category = "Overweight";
            }
        %>
        
        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="weight" value="<%= weight %>" />
            <jsp:param name="height" value="<%= height %>" />
            <jsp:param name="bmi" value="<%= bmi %>" />
            <jsp:param name="category" value="<%= category %>" />
        </jsp:forward>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
