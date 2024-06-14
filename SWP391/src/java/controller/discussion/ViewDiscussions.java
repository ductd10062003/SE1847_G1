package controller.discussion;

import entity.Category;
import entity.Discussion;
import entity.DiscussionCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOCategory;
import model.DAODiscussion;
import model.DAODiscussionCategory;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

@WebServlet (name = "view-discussions", urlPatterns = {"/view-discussions"})
public class ViewDiscussions extends HttpServlet {



    private void HandleViewDiscussion(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        String[] categories = req.getParameterValues("categories");
        ArrayList<DiscussionCategory> categoryList = new DAODiscussionCategory().getAllCategories();
        ArrayList<Discussion> discussions;
        if(keyword != null && categories != null){
            discussions = new DAODiscussion().getDiscussionsByKeywordAndCategories(keyword, categories);
        } else if(categories != null){
            discussions = new DAODiscussion().getDiscussionsByCategories(categories);
        } else if(keyword != null){
            discussions = new DAODiscussion().getDiscussionsByKeyword(keyword);
        } else {
            discussions = new DAODiscussion().getAllDiscussions();
        }

        req.getSession().setAttribute("discussions", discussions);
        req.getSession().setAttribute("categories", categoryList);
        req.getRequestDispatcher("BrowseDiscussion.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HandleViewDiscussion(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HandleViewDiscussion(req, resp);
    }
}
