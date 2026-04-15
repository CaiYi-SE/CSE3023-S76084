<%-- 
    Document   : header
    Created on : 14 Apr 2026, 10:49:46 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: beige;
            }
            nav{
                background-color: #a08c96;
                text-decoration: none;
                padding: 20px;
                
            }
            a{
                text-decoration: none;
                padding: 0px 20px;
                color:beige;
                
            }
            a:hover{
                color: black;
            }
        </style>
    </head>
    <body>
        <h1 style="background-color: #e4b8ab; color: black; text-align: center;
            padding: 20px; ">
            Student Club Registration System</h1>
        <nav>
            <a href="registerClub.jsp">Register Club</a>
            <a href="feeCalculator.jsp">Fee Calculator</a>
            <a href="memberDirectory.jsp">Member Directory</a>
        </nav>
    </body>
</html>
