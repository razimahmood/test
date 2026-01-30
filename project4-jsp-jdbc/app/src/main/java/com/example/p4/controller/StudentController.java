package com.example.p4.controller;

import com.example.p4.dao.StudentDAO;
import com.example.p4.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class StudentController extends HttpServlet {

    private StudentDAO dao;

    @Override
    public void init() {
        dao = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = trim(req.getParameter("action"));

        // Delete action: /student?action=delete&id=3
        if ("delete".equalsIgnoreCase(action)) {
            String idRaw = trim(req.getParameter("id"));
            if (!idRaw.isEmpty()) {
                try {
                    int id = Integer.parseInt(idRaw);
                    dao.deleteStudent(id);
                } catch (NumberFormatException ignored) {}
            }
            resp.sendRedirect("student");
            return;
        }

        // Default: list students
        req.setAttribute("students", dao.getAllStudents());
        req.getRequestDispatcher("/student-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        req.setCharacterEncoding("UTF-8");

        String name = trim(req.getParameter("name"));
        String email = trim(req.getParameter("email"));
        String course = trim(req.getParameter("course"));

        String error = null;

        if (name.isEmpty() || email.isEmpty() || course.isEmpty()) {
            error = "Missing required fields.";
        } else if (!email.contains("@")) {
            error = "Email must contain '@'.";
        }

        if (error != null) {
            // Re-render list with error message
            req.setAttribute("error", error);
            req.setAttribute("students", dao.getAllStudents());
            req.getRequestDispatcher("/student-list.jsp").forward(req, resp);
            return;
        }

        dao.addStudent(new Student(name, email, course));
        resp.sendRedirect("student");
    }

    private static String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
