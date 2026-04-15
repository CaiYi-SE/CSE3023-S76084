<%-- 
    Document   : feeCalculator
    Created on : 14 Apr 2026, 10:17:13 pm
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
        <h1>Membership Fee Calculator</h1>
        <form>
            <fieldset>
                <legend>Membership Fee Calculator</legend>
                <label for="activityNo">Number of Activities: </label>
                <input type="number" id="activityNo" name="activityNo" placeholder="E.g. 3" min="0" required><br><br>
                
                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                    <input type="reset" id="btnCancel" value="Cancel">
                </p>
                
                <%
                    int activityNo = 0;
                    int fee = 10;

                    String activityStr = request.getParameter("activityNo");

                    if (activityStr != null) {
                        activityNo = Integer.parseInt(activityStr);
                %>

                    <p>Total Membership Fee: RM <%= String.format("%.2f", activityNo * fee * 1.0) %></p>

                <%
                    }
                %>
            </fieldset>
        </form>
            <%@include file="footer.jsp" %>
    </body>
</html>
