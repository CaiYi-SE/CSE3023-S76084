<%-- 
    Document   : insertAuthor
    Created on : 12 May 2026, 2:26:41 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
        </style>
    </head>
    <body>
        <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>
        <fieldset>
            <legend>Author Registration</legend>
            <form action="processAuthor.jsp" method="POST">
                <label>Author No</label>
                <input type="text" name="authno"><br>

                <label>Name</label>
                <input type="text" name="name"><br>

                <label>City</label>
                <input type="text" name="city"><br>

                <label>State</label>
                <input type="text" name="state"><br>

                <label>Zip</label>
                <input type="text" name="zip"><br>

                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </form>
        </fieldset>
        <footer>&copy; 2026-Wong Cai Yi</footer>
        
    </body>
</html>
