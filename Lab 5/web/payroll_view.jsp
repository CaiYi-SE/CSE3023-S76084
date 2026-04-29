<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 3:13:05 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Payroll Display System</title>
        <style>
            body {
                margin: 4px;
            }
            table{
                border-collapse: collapse;
            }
            td, th {
                border: 2px solid black;
            }
            tr {
                background-color: #e9e2e2;
                
            }
            
            
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h2>Display Employee Detail</h2>
        <table border="2px solid black" cellpadding="8">
            <thead>
                <tr style="background-color: #beacac ;">
                    <th>No.</th>
                    <th>Name</th>
                    <th>Employee Id</th>
                    <th>Department</th>
                    <th>Basic Salary</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeList}" var="emp" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${emp.name}</td>
                        <td>${emp.empId}</td>
                        <td>${emp.department}</td>
                        <td>${emp.basicSalary}</td>
                        <td>
                            <c:choose>
                                <c:when test="${emp.basicSalary >= 3000}">
                                    <span class="senior">Senior</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="junior">Junior</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%@include file="footer.jsp" %>
    </body>
</html>
