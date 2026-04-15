<%-- 
    Document   : processRegistration
    Created on : 14 Apr 2026, 4:52:12 pm
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
        <fieldset>
            <%
                //define variables..
                String stuName = "";
                String matricNo = "";
                String club = "";
                
                stuName = request.getParameter("stuName");
                matricNo = request.getParameter("matricNo");
                club = request.getParameter("club");
            %>
            <!-- display the output -->
            <h2>Details of registration: </h2>
            <p>Loan Request: <%= stuName %></p>
            <p>Period of payment : <%= matricNo %></p>
            <p>Selected Club : <%= club %></p>
        </fieldset>
        <%@include file="footer.jsp" %>
    </body>
</html>
