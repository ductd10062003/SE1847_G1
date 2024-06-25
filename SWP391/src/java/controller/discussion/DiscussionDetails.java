package controller.discussion;

import entity.Comment;
import entity.Discussion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOComment;
import model.DAODiscussion;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "discussion-details", urlPatterns = {"/discussion-details"})
public class DiscussionDetails extends HttpServlet {

    private void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id") == null ? (String) req.getSession().getAttribute("id") : req.getParameter("id");

        if(id == null)
            req.getRequestDispatcher("view-discussions").forward(req, resp);
        else
        {
            Discussion discussion = new DAODiscussion().getDiscussionById(Integer.parseInt(id));
            ArrayList<Comment> comments = new DAOComment().getCommentByDiscussionId(Integer.parseInt(id));

            req.getSession().setAttribute("comments", comments);
            req.getSession().setAttribute("discussion", discussion);

            req.getRequestDispatcher("ViewDiscussion.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

}
