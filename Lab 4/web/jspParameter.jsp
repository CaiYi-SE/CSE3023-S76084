<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 1:55:59 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action</title>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:include and jsp:param to display information</h1>
            <%
                String sCode = "CSE3023";
                String sSubject = "Web-based Application Development";
                String sCredit = "3(2+1)";
            %>

            <jsp:include page="subjectInfo.jsp" flush="true">
                <jsp:param name="code" value="<%= sCode %>"/>
                <jsp:param name="subject" value="<%= sSubject %>"/>
                <jsp:param name="credit" value="<%= sCredit %>"/>
            </jsp:include>
        </div>
    </body>
</html>
