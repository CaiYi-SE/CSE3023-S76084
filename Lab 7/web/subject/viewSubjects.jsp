<%-- 
    Document   : viewSubjects
    Created on : 21 May 2026, 8:50:00 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="bean.subjectBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Registered Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 shadow rounded">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>My Academic Workspace</h2>
            <div>
                <a href="dashboard.jsp" class="btn btn-secondary btn-sm">Main Dashboard</a>
                <a href="subject/registerSubject.jsp" class="btn btn-success btn-sm">Register New Subject</a>
            </div>
        </div>
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th style="width: 200px;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<subjectBean> list = (List<subjectBean>) request.getAttribute("subjectList");
                    if (list != null && !list.isEmpty()) {
                        for (subjectBean sub : list) {
                %>
                <tr>
                    <td><%= sub.getSubject_code() %></td>
                    <td><%= sub.getSubject_name() %></td>
                    <td>
                        <a href="subjectServlet?action=edit&id=<%= sub.getId() %>" class="btn btn-warning btn-sm">Update</a>
                        <a href="subjectServlet?action=delete&id=<%= sub.getId() %>" class="btn btn-danger btn-sm" 
                           onclick="return confirm('Are you sure you want to drop this subject?');">Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3" class="text-center text-muted py-4">No subjects registered yet.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>