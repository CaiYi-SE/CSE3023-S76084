<%-- 
    Document   : insertStudent
    Created on : 12 May 2026, 3:43:31 pm
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
        <h1>Lab 6 - Task 3 : Create Records Constrained by Regular Expression In JSP</h1>
        <fieldset>
            <form action="processBook.jsp" method="POST">
                <legend>Student Registration</legend>
                <label>Student No</label>
                <input type="text" name="stuno">

                <label>Name</label>
                <input type="text" name="name">

                <label>Program</label>
                <select name="program">
                    <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                    <option value="BSc. with IM">BSc. with IM</option>
                    <option value="BSc. in Networking">BSc. in Networking</option>
                    <option value="BSc. in Robotics">BSc. in Robotics</option>
                </select>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </form>
        </fieldset>
        <footer>&copy; 2026-Wong Cai Yi</footer>
    </body>
</html>
