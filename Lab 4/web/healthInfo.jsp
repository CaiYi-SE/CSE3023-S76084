<%-- 
    Document   : healthInfo
    Created on : 21 Apr 2026, 3:49:39 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Information</title>
        <style>
        
        h1 {
            color: #333;
        }

        h3 {
            margin-top: 20px;
            color: #444;
        }

        .result {
            padding: 10px;
            margin: 10px 0;
            border-left: 5px solid #6f42c1;
            background-color: #ffffff;
            width: fit-content;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 15px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #6f42c1;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
    </head>
    
    <body>
        <%@include file="header.jsp" %>
       
        <h1>BMI Categories</h1>
    
        <%
            // Store BMI categories using an ArrayList
            ArrayList<String[]> bmiList = new ArrayList<String[]>();

            // Add 3 categories to the list
            bmiList.add(new String[]{"Underweight", "Less than 18.5", "Eat more nutritious food"});
            bmiList.add(new String[]{"Normal", "18.5 - 24.9", "Maintain healthy lifestyle"});
            bmiList.add(new String[]{"Overweight", "25 and above", "Exercise regularly"});
        %>

        <!-- Display categories dynamically in a table -->
        <table>
            <tr>
                <th>Category</th>
                <th>BMI Range</th>
                <th>Recommendation</th>
            </tr>

            <%
                for(String[] category : bmiList) {
            %>
            <tr>
                <td><%= category[0] %></td>
                <td><%= category[1] %></td>
                <td><%= category[2] %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%@include file="footer.jsp" %>
    </body>
</html>
