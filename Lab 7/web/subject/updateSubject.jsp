<%-- 
    Document   : updateSubject
    Created on : 21 May 2026, 8:51:41 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.subjectBean"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <%
        subjectBean sub = (subjectBean) request.getAttribute("subject");
        if (sub == null) {
            response.sendRedirect(request.getContextPath() + "/subjectServlet?action=list");
            return;
        }
    %>
    <div class="container bg-white p-4 shadow rounded" style="max-width: 500px;">
        <h3 class="mb-4">Modify Course Details</h3>
        <form action="${pageContext.request.contextPath}/subjectServlet" method="POST">
            <input type="hidden" name="action" value="update">

            <input type="hidden" name="id" value="<%= sub.getId() %>">

            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Code</label>
                <input type="text" name="subjectCode" class="form-control" value="<%= sub.getSubject_code() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Name</label>
                <input type="text" name="subjectName" class="form-control" value="<%= sub.getSubject_name() %>" required>
            </div>

            <button type="submit" class="btn btn-warning w-100 py-2 text-dark fw-semibold">Save Changes</button>
            <a href="../subjectServlet?action=list" class="btn btn-light w-100 mt-2 border">Cancel</a>
        </form>
    </div>
</body>
</html>
