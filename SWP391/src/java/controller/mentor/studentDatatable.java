/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.FlashCard;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class studentDatatable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet studentDatatable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet studentDatatable at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String contextPath;
    private String servletContextPath;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOUser daoUser = new DAOUser();
        String courseId_raw = request.getParameter("course_id");
        int courseId = Integer.parseInt(courseId_raw);

        ArrayList<User> list = daoUser.getUserByCourseId(courseId);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/student-datatable.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        contextPath = "";
        servletContextPath = req.getContextPath() + "manage-mentor.jsp";

        redirectAction(req, resp);
    }

    private void redirectAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");

        if (action == null) {
            return;
        }

        switch (action) {
            case "activate":
                activateMentor(req, resp);
                break;
            case "deactivate":
                deactivateMentor(req, resp);
                break;
            default:
                printError(req, resp, "Invalid action");
        }

    }

    private void printError(HttpServletRequest req, HttpServletResponse resp, String message) throws IOException {
        try {
            req.setAttribute("error", message);
            req.getRequestDispatcher(contextPath).forward(req, resp);
        } catch (ServletException | IOException e) {
            log(e.getMessage());
        }
    }

    private void deactivateMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if (mentor == null || mentor.getActive() != 1) {
            printError(req, resp, "Mentor not found");
            return;
        }
        mentor.setActive(0);
        if (new DAOUser().updateUserActiveInfo(mentor)) {
            resp.sendRedirect(servletContextPath);
        } else {
            printError(req, resp, "Error deactivating mentor");
        }
    }

    private void activateMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if (mentor == null || mentor.getActive() != 0) {
            printError(req, resp, "Mentor not found");
            return;
        }
        mentor.setActive(1);

        if (new DAOUser().updateUserActiveInfo(mentor)) {
            resp.sendRedirect(servletContextPath);
        } else {
            printError(req, resp, "Error activating mentor");
        }

    }

}
