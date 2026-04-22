<%-- 
    Document   : subjectInfo
    Created on : 21 Apr 2026, 2:02:52 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Information</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="card">
            <p class="form-title">Subject Information</p>

            <p>Code: <%= request.getParameter("code") %></p>
            <p>Subject: <%= request.getParameter("subject") %></p>
            <p>Credit: <%= request.getParameter("credit") %></p>
        </div>
    </body>
</html>
