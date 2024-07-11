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

    private  String contextPath;
    private String servletContextPath;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        contextPath = "manage-mentor.jsp";
        servletContextPath = req.getContextPath() + "/admin-mentor-manage/manage-mentor";




        User user = (User) req.getSession().getAttribute("user");
        if(user == null || user.getRole() != 1){
            resp.sendRedirect("login");
            return;
        }

        req.getSession().setAttribute("mentor-list", new DAOUser().getAllMentors());

        if(req.getParameter("action") != null)
            redirectAction(req, resp);
        else
            req.getRequestDispatcher(contextPath).forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        contextPath = "manage-mentor.jsp";
        servletContextPath = req.getContextPath() + "/admin-mentor-manage/manage-mentor";

        redirectAction(req, resp);

    }

    private void redirectAction(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");

        if(action == null)
            return;

        switch (action){
            case "search":
                searchMentor(req, resp);
                break;
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
        if(mentor == null || mentor.getActive() != 1){
            printError(req, resp, "Mentor not found");
            return;
        }
        mentor.setActive(0);
        if(new DAOUser().updateUserActiveInfo(mentor)){
            resp.sendRedirect(servletContextPath);
        } else {
            printError(req, resp, "Error deactivating mentor");
        }
    }

    private void activateMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        User mentor = new DAOUser().getUserByID(Integer.parseInt(id));
        if(mentor == null || mentor.getActive() != 0){
            printError(req, resp, "Mentor not found");
            return;
        }
        mentor.setActive(1);

        if(new DAOUser().updateUserActiveInfo(mentor)){
            resp.sendRedirect(servletContextPath);
        } else {
            printError(req, resp, "Error activating mentor");
        }

    }

    private void searchMentor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String keyword = req.getParameter("query");
        if(keyword == null){
            printError(req, resp, "Keyword is required");
            return;
        }
        req.getSession().setAttribute("mentor-list", new DAOUser().searchMentor(keyword));
        try {
            req.getRequestDispatcher(contextPath).forward(req, resp);
        } catch (ServletException | IOException e) {
            printError(req, resp, "Error searching mentor");
        }
    }


}
