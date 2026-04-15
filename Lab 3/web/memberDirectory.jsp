<%-- 
    Document   : memberDirectory
    Created on : 14 Apr 2026, 10:52:33 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Member Directory</h1>
        <%
            // create ArrayList object
            ArrayList<String> memberList = new ArrayList<String>();
            // store member name
            memberList.add(0, "Mohamad Azam");
            memberList.add(1, "Peter Chong");
            memberList.add(2, "Rahimah Mansor");
            memberList.add(3, "Sri Devi");
            memberList.add(4, "Ng Hue Ween");
            memberList.add(5, "S. Nagarajan");
        %>
        <p>Total Members: <%= memberList.size() %></p>

        <table border="1" cellpadding="5">
            <tr>
                <th>No</th>
                <th>Member Name</th>
            </tr>
            <%
                for (int i = 0; i < memberList.size(); i++) {
            %>
            <tr>
                <td><%= (i + 1) %></td>
                <td><%= memberList.get(i) %></td>
            </tr>
            <%
                }
            %>
        </table>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
