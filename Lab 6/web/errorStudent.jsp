<%-- 
    Document   : errorStudent
    Created on : 12 May 2026, 4:04:09 pm
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
        <form id="errorForm" action="insertStudent.jsp" method="POST">
            <h1>Lab 6 - Task 3 : Create Records Constrained by Regular Expression In JSP</h1>
            <p><jsp:expression> exception.getMessage() </jsp:expression></p>
            <br>
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
