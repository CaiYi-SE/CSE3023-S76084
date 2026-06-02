<%-- 
    Document   : CarIndex
    Created on : 2 Jun 2026, 5:11:01 pm
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body class="container mt-5">
        <div class="jumbotron">
            <h1>Application MVC system for Car Management</h1>
            <br>
            <div class="list-group col-md-4">
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/list">All Car List</a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/new">Add a New Car</a>
            </div>
        </div>
    </body>
</html>