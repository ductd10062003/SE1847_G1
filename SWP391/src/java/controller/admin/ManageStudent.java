package controller.admin;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "manage-student", urlPatterns = {"/admin-mentor-manage/manage-student"})
public class ManageStudent extends HttpServlet {

    private static final String CONTEXT_PATH = "manage-student.jsp";
    private static final String SERVLET_CONTEXT_PATH = "/admin-mentor-manage/manage-student";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        redirectAction(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {



        redirectAction(request, resp);
    }

    private void redirectAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String action = req.getParameter("action");

        if ("promote".equals(action)) {
            return;
        }
        if ("demote".equals(action)) {
            return;
        }
        if ("activate".equals(action)) {
            return;
        }
        if ("deactivate".equals(action)) {
            return;
        }
        if ("search".equals(action)) {
            searchStudent(req, resp);
            return;
        }

        ArrayList<User> studentList = new DAOUser().getStudents();

        req.getSession().setAttribute("student-list", studentList);

        req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
    }


    private void deactivateStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if (mentor == null || mentor.getActive() != 1) {
            printError(req, resp, "Mentor not found");
            return;
        }
        mentor.setActive(0);
        if (new DAOUser().updateUserActiveInfo(mentor)) {
            resp.sendRedirect(SERVLET_CONTEXT_PATH);
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
            resp.sendRedirect(SERVLET_CONTEXT_PATH);
        } else {
            printError(req, resp, "Error activating mentor");
        }

    }

    private void searchStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String keyword = req.getParameter("query");
        if (keyword == null) {
            printError(req, resp, "Keyword is required");
            return;
        }
        req.getSession().setAttribute("student-list", new DAOUser().searchStudent(keyword));
        try {
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            printError(req, resp, "Error searching mentor");
        }
    }

    private void printError(HttpServletRequest req, HttpServletResponse resp, String message) throws IOException {
        try {
            req.setAttribute("error", message);
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            log(e.getMessage());
        }
    }
}
