package controller.discussion;

import entity.Discussion;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAODiscussion;

import java.io.IOException;

@WebServlet(name = "create-discussion", urlPatterns = {"/create-discussion"})
public class CreateDiscussion extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if(user == null){
            resp.sendRedirect("login");
            return;
        }

        req.getRequestDispatcher("discussion/create-discussion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("discussionTitle");
        String content = req.getParameter("commentContent");
        String category = req.getParameter("discussionCategory");

        User user = (User) req.getSession().getAttribute("user");

        if(user == null){
            resp.sendRedirect("login");
            return;
        }

        java.util.Date date = new java.util.Date();
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());

        Discussion discussion = new Discussion(title, content, sqlTime.toString(), sqlTime.toString(), true, user.getUser_id(), Integer.parseInt(category));
        new DAODiscussion().addDiscussion(discussion);

        resp.sendRedirect("view-discussions");

    }
}
