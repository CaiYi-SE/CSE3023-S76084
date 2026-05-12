<%-- 
    Document   : processAuthor
    Created on : 12 May 2026, 2:26:58 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<jsp:useBean id="myAuthor" class="Lab6.com.Author" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Perform creating and retrieving records via JSP page</h1>
        
        <jsp:setProperty name="myAuthor" property="*"/>
        
        <%
            int result;

            // Establishing the driver and connection
            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/cse3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            // 19. Create a PreparedStatement object
            String sInsertQry = "INSERT INTO author(authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            // Setting parameters from the 'myAuthor' object
            myPS.setString(1, myAuthor.getAuthno());
            myPS.setString(2, myAuthor.getName());
            myPS.setString(3, myAuthor.getAddress());
            myPS.setString(4, myAuthor.getCity());
            myPS.setString(5, myAuthor.getState());
            myPS.setString(6, myAuthor.getZip());

            // 20. Execute the query and display the result
            result = myPS.executeUpdate();

            if (result > 0) {
                out.println("\tRecord successfully added into Author table...!");
                out.print("<p>" + "Record with author no " + myAuthor.getAuthno() 
                    + " successfully created..!" + "</p>");

                out.print("<p>" + "Details of record are: " + "</p>");
                out.print("<p>Author Name    : " + myAuthor.getName() + "</p>");
                out.print("<p>Address : " + myAuthor.getAddress() + "</p>");
                out.print("<p>City    : " + myAuthor.getCity() + "</p>");
                out.print("<p>State   : " + myAuthor.getState() + "</p>");
                out.print("<p>Zip     : " + myAuthor.getZip() + "</p>");
            }
            
            //step 5: close the database connection
            System.out.println("Step 5: Close database connection...!");
            myConnection.close();
            System.out.println(" ");
            System.out.println("Database connection is closed...!");
        %>
    </body>
</html>
