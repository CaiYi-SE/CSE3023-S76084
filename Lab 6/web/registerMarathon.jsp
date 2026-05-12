<%-- 
    Document   : registerMarathon
    Created on : May 12, 2026, 7:14:55 PM
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
        <h1>Register Marathon</h1>
        
        <div>
            <fieldset>
                <legend>Marathon Registration</legend>
                
                <form action="processMarathon.jsp" method="POST">
                    <label>IC No:</label>
                    <input type="text" placeholder="E.g.: 921110-10-2514" name="icno"/><br>
                    
                    <label>Name: </label>
                    <input type="text" placeholder="Enter your name" name="name"/><br>
                    
                    <label>Category: </label>
                    <select name="category">
                        <option>5KM</option>
                        <option>7KM</option>
                        <option>10KM</option>
                    </select><br>
                    
                    <p>
                        <input type="submit" value="Submit"/>
                        <button type="button" onclick="location.href='registerMarathon.jsp'">Cancel</button>
                    </p>
                </form>
            </fieldset>
        </div>
    </body>
</html>
