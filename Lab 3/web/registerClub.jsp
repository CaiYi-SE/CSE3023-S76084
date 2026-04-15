<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 4:36:00 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Registration Form</h1>
        <form action="processRegistration.jsp" method="POST" id="registerForm">
            <fieldset>
                <legend>Registration</legend>
                <label for="student">Student Name: </label>
                <input type="text" id="stuName" name="stuName" placeholder="WONG CAI YI" size="40" ><br><br>
                <label for="matricNo">Matric Number: </label>
                <input type="text" id="matricNo" name="matricNo" placeholder="S76084" size="10" ><br><br>
                <label for="club">Select Club: </label>
                <select id="club" name="club" required>
                    <option value="">-- Select Club --</option>
                    <option value="programming">Programming Club</option>
                    <option value="multimedia">Multimedia Club</option>
                    <option value="networking">Networking Club</option>
                    <option value="ai">AI & Data Science Club</option>
                </select>
                <br>
                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                    <input type="reset" id="btnCancel" value="Cancel">
                </p>
            </fieldset>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
