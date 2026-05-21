package controller;

import bean.StudentBean;
import bean.subjectBean;
import dao.subjectDAO;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class subjectServlet extends HttpServlet {
    
    private subjectDAO dao = new subjectDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // 1. Session Verification Guard
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }
        
        // 2. Extract identity parameters implicitly from session
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = loggedUser.getMatricNo();

        // 3. Operational action routing parameter
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "insert":
                    insertSubject(request, response, matricNo);
                    break;
                case "delete":
                    deleteSubject(request, response, matricNo);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateSubject(request, response, matricNo);
                    break;
                case "list":
                default:
                    listSubjects(request, response, matricNo);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private void listSubjects(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws ServletException, IOException {
        List<subjectBean> list = dao.getSubjectsByMatric(matricNo);
        request.setAttribute("subjectList", list);
        request.getRequestDispatcher("subject/viewSubjects.jsp").forward(request, response);
    }

    private void insertSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws IOException {
        String code = request.getParameter("subjectCode");
        String name = request.getParameter("subjectName");

        subjectBean sub = new subjectBean();
        sub.setMatric_no(matricNo);
        sub.setSubject_code(code);
        sub.setSubject_name(name);

        dao.registerSubject(sub);
        response.sendRedirect(request.getContextPath() + "/subjectServlet?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        subjectBean existingSubject = dao.getSubjectById(id);
        request.setAttribute("subject", existingSubject);
        request.getRequestDispatcher("subject/updateSubject.jsp").forward(request, response);
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
        throws IOException {
        // 1. Ensure the id hidden input can be read properly
        int id = Integer.parseInt(request.getParameter("id"));

        // 2. These parameter strings are case-sensitive! 
        // They MUST match the 'name' attribute inside your HTML input elements exactly.
        String code = request.getParameter("subjectCode"); 
        String name = request.getParameter("subjectName"); 

        subjectBean sub = new subjectBean();
        sub.setId(id);
        sub.setMatric_no(matricNo);
        sub.setSubject_code(code);
        sub.setSubject_name(name);

        dao.updateSubject(sub);

        // Your dynamic context path redirect that we fixed earlier
        response.sendRedirect(request.getContextPath() + "/subjectServlet?action=list");
    }

    private void deleteSubject(HttpServletRequest request, HttpServletResponse response, String matricNo)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteSubject(id, matricNo);
        response.sendRedirect(request.getContextPath() + "/subjectServlet?action=list");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}