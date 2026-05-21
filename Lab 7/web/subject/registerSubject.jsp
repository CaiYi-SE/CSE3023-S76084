<%-- 
    Document   : registerSubject
    Created on : 19 May 2026, 4:40:58 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register New Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 shadow rounded" style="max-width: 500px;">
        <h3 class="mb-4 text-center">Register New Subject</h3>
        <form action="../subjectServlet" method="POST">
            <input type="hidden" name="action" value="insert">
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Code</label>
                <input type="text" name="subjectCode" class="form-control" placeholder="e.g., CSM3023" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-semibold">Subject Name</label>
                <input type="text" name="subjectName" class="form-control" placeholder="e.g., Web App Development" required>
            </div>
            <button type="submit" class="btn btn-success w-100 py-2">Add Subject</button>
            <a href="../subjectServlet?action=list" class="btn btn-light w-100 mt-2 border">Back to Workspace</a>
        </form>
    </div>
</body>
</html>
