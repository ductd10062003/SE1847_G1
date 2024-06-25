package controller.discussion;

import entity.Comment;
import entity.Discussion;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOComment;


import java.io.IOException;

@WebServlet(name = "add-comment", urlPatterns = {"/add-comment"})
public class AddComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = req.getParameter("commentContent");
        User user = (User) req.getSession().getAttribute("user");
        Discussion discussion = (Discussion) req.getSession().getAttribute("discussion");
        req.getSession().removeAttribute("discussion");
        req.getSession().setAttribute("id", Integer.toString(discussion.getDiscussion_id()));
        java.util.Date date = new java.util.Date();
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());

        Comment comment = new Comment(content, user.getUser_id(), 0, discussion.getDiscussion_id(), sqlTime.toString());
        new DAOComment().insertComment(comment);

        req.getRequestDispatcher("discussion-details").forward(req, resp);
    }
}
