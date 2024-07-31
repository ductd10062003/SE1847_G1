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
            if(promoteStudent(req, resp) == 0)
                return;
        }
        if ("demote".equals(action)) {
            if(demoteStudent(req, resp) == 0)
                return;
        }
        if ("activate".equals(action)) {
            if (activateStudent(req, resp) == 0)
                return;
        }
        if ("deactivate".equals(action)) {
            if (deactivateStudent(req, resp) == 0)
                return;
        }
        if ("search".equals(action)) {
            if (searchStudent(req, resp) == 0)
                return;
        }

        ArrayList<User> studentList = new DAOUser().getStudents();

        req.getSession().setAttribute("student-list", studentList);

        req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
    }

    private int demoteStudent(HttpServletRequest req, HttpServletResponse resp) throws  IOException{
        String id = req.getParameter("id");
        User student = new DAOUser().getUserByID(Integer.parseInt(id));
        if (student == null) {
            printError(req, resp, "Student not found");
            return 0;
        }
        if (student.getRole() != 4) {
            printError(req, resp, "Internal error. Please try again later");
            return 0;
        }
        student.setRole(3);
        if (!new DAOUser().updateUserRole(student)) {
            printError(req, resp, "Error demoting student");
            return 0;
        }
        return 1;
    }

    private int promoteStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User student = new DAOUser().getUserByID(Integer.parseInt(id));
        if (student == null) {
            printError(req, resp, "Student not found");
            return 0;
        }
        if (student.getRole() != 3) {
            printError(req, resp, "Internal error. Please try again later");
            return 0;
        }
        student.setRole(4);
        if (!new DAOUser().updateUserRole(student)) {
            printError(req, resp, "Error promoting student");
            return 0;
        }
        return 1;
    }

    private int deactivateStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User student = new DAOUser().getUserByID(Integer.parseInt(id));
        if (student == null) {
            printError(req, resp, "Mentor not found");
            return 0;
        }
        if (student.getActive() != 1) {
            printError(req, resp, "Student is already deactivated");
            return 0;
        }
        if (student.getRole() != 3 && student.getRole() != 4) {
            printError(req, resp, "Invalid student role");
            return 0;
        }
        student.setActive(0);
        if (!new DAOUser().updateUserActiveInfo(student)) {
            printError(req, resp, "Error deactivating mentor");
            return 0;
        }
        return 1;
    }

    private int activateStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User student = new DAOUser().getUserByID(Integer.parseInt(id));
        if (student == null) {
            printError(req, resp, "Student not found");
            return 0;
        }
        if (student.getActive() != 0) {
            printError(req, resp, "Student is already active");
            return 0;
        }
        if (student.getRole() != 3 && student.getRole() != 4) {
            printError(req, resp, "Invalid student role");
            return 0;
        }

        student.setActive(1);

        if (!new DAOUser().updateUserActiveInfo(student)) {
            printError(req, resp, "Error activating mentor");
            return 0;
        }

        return 1;
    }

    private int searchStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String keyword = req.getParameter("query");
        if (keyword == null) {
            printError(req, resp, "Keyword is required");
            return 0;
        }
        req.getSession().setAttribute("student-list", new DAOUser().searchStudent(keyword));
        try {
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            printError(req, resp, "Error searching mentor");
            return 0;
        }
        return 1;
    }

    private void printError(HttpServletRequest req, HttpServletResponse resp, String message) throws IOException {
        try {
            req.getSession().setAttribute("error", message);
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            log(e.getMessage());
        }
    }
}
