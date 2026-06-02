<%-- 
    Document   : CarForm
    Created on : 2 Jun 2026, 5:03:25 pm
    Author     : Asus
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/${car != null ? 'update' : 'insert'}" method="post">
                        
                        <h2>
                            <c:out value="${car != null ? 'Edit Car' : 'Add New Car'}" />
                        </h2>
                                
                        <c:if test="${car != null}">
                            <input type="hidden" name="carId" value="<c:out value='${car.carId}' />" />
                        </c:if>
                            
                        <fieldset class="form-group">
                            <label>Car Brand</label>
                            <input type="text" value="<c:out value='${car.brand}' />" class="form-control" name="Brand" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Car Model</label>
                            <input type="text" value="<c:out value='${car.model}' />" class="form-control" name="Model" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Car Cylinder</label>
                            <input type="number" value="<c:out value='${car.cyclinder}' />" class="form-control" name="Cyclinder" required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Car Price</label>
                            <input type="text" value="<c:out value='${car.price}' />" class="form-control" name="Price" required="required">
                        </fieldset>
                            
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>