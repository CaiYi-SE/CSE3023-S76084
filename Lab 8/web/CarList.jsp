<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="${pageContext.request.contextPath}/" class="navbar-brand">Car Management App</a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/" class="nav-link">Car List</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Cars</h3>
                <hr>
                <div class="container text-left">
                    <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Car</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cylinder</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${list}">
                            <tr>
                                <td><c:out value="${car.carId}"/></td>
                                <td><c:out value="${car.brand}"/></td>
                                <td><c:out value="${car.model}"/></td>
                                <td><c:out value="${car.cyclinder}"/></td>
                                <td>$<c:out value="${car.price}"/></td>
                                <td>
                                    <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/edit?carId=${car.carId}">Edit</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/delete?carId=${car.carId}" 
                                       onclick="return confirm('Are you sure you want to delete this car?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>