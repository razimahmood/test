package com.example.p3.web;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class ReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // show form page (view)
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String customerName = trim(req.getParameter("customerName"));
        String phone = trim(req.getParameter("phone"));
        String paxRaw = trim(req.getParameter("pax"));
        String seating = trim(req.getParameter("seating"));
        String notes = trim(req.getParameter("notes"));

        String error = null;

        if (customerName.isEmpty() || phone.isEmpty() || paxRaw.isEmpty() || seating.isEmpty()) {
            error = "Missing required fields.";
        }

        int pax = 0;
        if (error == null) {
            try {
                pax = Integer.parseInt(paxRaw);
                if (pax <= 0) error = "Pax must be greater than 0.";
            } catch (NumberFormatException e) {
                error = "Pax must be a valid number.";
            }
        }

        // Put data into request scope for JSP to render
        req.setAttribute("customerName", customerName);
        req.setAttribute("phone", phone);
        req.setAttribute("pax", pax);
        req.setAttribute("seating", seating);
        req.setAttribute("notes", notes);
        req.setAttribute("error", error);

        // forward to result view (no redirect yet)
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }

    private static String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
