<%-- 
    Document   : populateArray
    Created on : 14 Apr 2026, 2:36:45 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Array</title>
    </head>
    <body>
        
        <h1>Read Java array and populate it into HTML table</h1>
        
        
        <%
            //define the data
            String[][] array = {
                {"Salesman", "Jan", "Feb", "Mar"},
                {"Salesman 1", "2,500", "1,900", "2,400"},
                {"Salesman 2", "2000", "1900", "2400"},
                {"Salesman 3 ", "1800", "2200", "2450"}
            };
        %>
        
        <style>
            table {
                border-collapse: collapse;
                width: 50%;
                text-align: center;
                font-family: Arial;
                margin: 0 auto;
            }
            th {
                background-color: #d4b97c; /* gold-ish header */
                padding: 10px;
            }
            td {
                background-color: white; /* light beige */
                padding: 10px;
            }
            tr:nth-child(even) td { /* selects even-numbered rows (2nd, 4th, 6th, …)*/
                background-color: #e7e3d3; /* alternate row */
            }
        </style>
        
        <table border="1">
            <%
                for (int i = 0; i < array.length; i++) {
                    out.println("<tr>");

                    for (int j = 0; j < array[i].length; j++) {
                        if (i == 0) {
                            out.println("<th>" + array[i][j] + "</th>"); // header row
                        } else {
                            out.println("<td>" + array[i][j] + "</td>");
                        }
                    }

                    out.println("</tr>");
                }
            %>
        </table>
        <p>&COPY; 2026 - CAI YI</p>
        
    </body>
</html>
