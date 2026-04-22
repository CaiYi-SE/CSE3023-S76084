<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 3:15:32 pm
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
        <fieldset>
            <legend>BMI Calculator Form</legend>
            <form action="processBMI.jsp" method="post">
                <label>Weight (kg)*</label>
                <input type="number" step="0.01" min="1" placeholder="Weight" name="weight" required><br><br>
                <label>Height (m)*</label>
                <input type="number" step="0.01" min="1" placeholder="Height" name="height" required><br><br>
                <button type="submit">Submit</button>
            </form>
        </fieldset>
        <%@include file="footer.jsp" %>
    </body>
</html>
