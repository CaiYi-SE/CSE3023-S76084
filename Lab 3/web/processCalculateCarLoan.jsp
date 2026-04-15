<%-- 
    Document   : processCalculateCarLoan
    Created on : 14 Apr 2026, 3:39:46 pm
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
        <h1>Perform Car Loan Calculation</h1>
        <fieldset>
            <%
                //define variables..
                int loanAmount = 0;
                int loanPeriod = 0;
                
                loanAmount = Integer.parseInt(request.getParameter("loanAmount"));
                loanPeriod = Integer.parseInt(request.getParameter("period"));
            %>
            <!-- display the output -->
            <h2>Details of car loan: </h2>
            <p>Loan Request: <%= loanAmount %></p>
            <p>Period of payment : <%= loanPeriod %></p>
            <p>Total Loan (+interest) : <%= loanAmount*3.171*loanPeriod %></p>
        </fieldset>
        <p>&copy; 2026 - Cai Yi</p>
    </body>
</html>
