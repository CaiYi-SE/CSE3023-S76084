<%-- 
    Document   : forward
    Created on : 21 Apr 2026, 2:07:15 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Forward)</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:forward to display user information</h1>
            <jsp:forward page="forwardInfo.jsp">
                <jsp:param name="uname" value="Wong Cai Yi" />
                <jsp:param name="email" value="s76084@ocean.umt.edu.my" />
                <jsp:param name="nationality" value="Malaysia" />
                <jsp:param name="background" value="Student" />
            </jsp:forward>
        </div>
    </body>
</html>
