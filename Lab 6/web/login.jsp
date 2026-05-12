<%-- 
    Document   : login
    Created on : May 12, 2026, 7:45:42 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div>
            <form action="doLogin.jsp" method="POST">
                <h1>User Login</h1>
                
                <label>Username: </label>
                <input type="text" name="Username" id="username" required/>
                
                <label>Password: </label>
                <input type="password" name="Password" id="password" required/>
                
                <p>
                    <input type="submit" value="User Login" id="btn"/>
                </p>
            </form>
        </div> 
    </body>
</html>
