<%-- 
    Document   : registerSubject
    Created on : 19 May 2026, 4:40:58 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Subject</title>
    </head>
    <body>
        <h2>Register New Subject</h2>
        <form action="subjectServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="register">
                Matric No: <input type="text" name="matricNo" required><br><br>
                Subject Code: <input type="text" name="subjectCode" required><br><br>
                Subject Name: <input type="text" name="subjectName" required><br><br>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
