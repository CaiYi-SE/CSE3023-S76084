<%-- 
    Document   : processMarathon
    Created on : 12 May 2026, 7:30:46 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Lab6.com.Database"%>
<%@page import="Lab6.com.Marathon"%>
<%@page import="Lab6.com.MarathonDAO"%>
<jsp:useBean id="myMarathon" class="Lab6.com.Marathon" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Task 5</h1>
        <jsp:setProperty name="myMarathon" property="*"/>
        <%
            int result;

            // Step 1: Create Database object...
            Database myDB = new Database();

            MarathonDAO object1 = new MarathonDAO();

            // Step 2: Add the records...
            result = object1.addDetails(myMarathon);

            // Step 3: Determine whether the transaction is success...
            if ( result > 0 )
            {
                System.out.println("\tRecord successfully added into Book's table...!");
                out.print("<p>" + "Record with IC No " + myMarathon.getIcno() + 
                          " successfully created..!" + "</p>");
                out.print("<p>" + "Details of record are: " + "</p>");
                out.print("<p>Ic No    : " + myMarathon.getIcno() + "</p>");
                out.print("<p>Name     : " + myMarathon.getName() + "</p>");
                out.print("<p>Category : " + myMarathon.getCategory() + "</p>");
            }

            // Step 4: Close database connection...!
            System.out.println("Step 5: Close database connection...!");
            myDB.closeConnection();
            System.out.println(" ");
            System.out.println("Database connection is closed...!");
        %>
    </body>
</html>
