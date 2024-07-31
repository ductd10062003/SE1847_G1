package controller.admin;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;

@WebServlet(name = "manage-mentor", urlPatterns = {"/admin-mentor-manage/manage-mentor"})
public class ManageMentor extends HttpServlet {

    private static final String CONTEXT_PATH = "manage-mentor.jsp";
    private static final String SERVLET_CONTEXT_PATH = "/admin-mentor-manage/manage-mentor";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getRole() != 1) {
            resp.sendRedirect("login");
            return;
        }
        redirectAction(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        redirectAction(req, resp);
    }

    private void redirectAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");

        if (action != null) {
            switch (action) {
                case "search":
                    if (searchMentor(req, resp) == 0) return;
                    break;
                case "activate":
                    if (activateMentor(req, resp) == 0) return;
                    break;
                case "deactivate":
                    if (deactivateMentor(req, resp) == 0) return;
                    break;
                default:
                    printError(req, resp, "Invalid action");
                    return;
            }
        }

        req.getSession().setAttribute("mentor-list", new DAOUser().getAllMentors());
        req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
    }

    private void printError(HttpServletRequest req, HttpServletResponse resp, String message) throws IOException {
        try {
            req.getSession().setAttribute("error", message);
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            log(e.getMessage());
        }
    }

    private int deactivateMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if (mentor == null) {
            printError(req, resp, "Mentor not found");
            return 0;
        }
        if (mentor.getActive() == 0) {
            printError(req, resp, "Mentor is already inactive");
            return 0;
        }

        mentor.setActive(0);
        if (!new DAOUser().updateUserActiveInfo(mentor)) {
            printError(req, resp, "Error deactivating mentor");
            return 0;
        }
        return 1;
    }

    private int activateMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if (mentor == null) {
            printError(req, resp, "Mentor not found");
            return 0;
        }
        if (mentor.getActive() == 1) {
            printError(req, resp, "Mentor is already active");
            return 0;
        }

        mentor.setActive(1);
        if (!new DAOUser().updateUserActiveInfo(mentor)) {
            printError(req, resp, "Error activating mentor");
            return 0;
        }
        return 1;
    }

    private int searchMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String keyword = req.getParameter("query");
        if (keyword == null) {
            printError(req, resp, "Keyword is required");
            return 0;
        }
        req.getSession().setAttribute("mentor-list", new DAOUser().searchMentor(keyword));
        try {
            req.getRequestDispatcher(CONTEXT_PATH).forward(req, resp);
        } catch (ServletException | IOException e) {
            printError(req, resp, "Error searching mentor");
            return 0;
        }
        return 1;
    }
}
