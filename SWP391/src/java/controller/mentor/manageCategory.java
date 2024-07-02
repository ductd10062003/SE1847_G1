package controller.mentor;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCategory;
import entity.Category;

@WebServlet(name = "manageCategory", urlPatterns = {"/mentor/manage-category"})
public class manageCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOCategory daoCategory = new DAOCategory();
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("id"));
            Category category = daoCategory.getCategoryByID(categoryId);
            request.setAttribute("category", category);
            request.getRequestDispatcher("../view-mentor/manager-category/update-category.jsp").forward(request, response);
        } else if ("create".equals(action)) {
            request.getRequestDispatcher("../view-mentor/manager-category/add-category.jsp").forward(request, response);
        } else {
        String keyword = request.getParameter("keyword");
        String sortType = request.getParameter("sort"); 

        Vector<Category> categories;
        if (sortType != null && !sortType.isEmpty()) {
            switch (sortType) {
                case "newest_created":
                    categories = daoCategory.getCategoriesSortedByNewestCreated();
                    break;
                case "oldest_created":
                    categories = daoCategory.getCategoriesSortedByOldestCreated();
                    break;
                case "newest_edited":
                    categories = daoCategory.getCategoriesSortedByNewestEdited();
                    break;
                case "oldest_edited":
                    categories = daoCategory.getCategoriesSortedByOldestEdited();
                    break;
                default:
                    categories = daoCategory.getAllCategories(); 
                    break;
            }
        } else {
            categories = daoCategory.getAllCategories(); 
        }
            request.setAttribute("categories", categories);
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("../view-mentor/manager-category/view-category.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOCategory daoCategory = new DAOCategory();
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String categoryName = request.getParameter("category_name");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String dateLastEdited = dtf.format(LocalDateTime.now());
            int active = Integer.parseInt(request.getParameter("active"));

            Category category = new Category(categoryId, categoryName, null, dateLastEdited, active);
            daoCategory.updateCategory(category);
            response.sendRedirect("manage-category");
        } else if ("add".equals(action)) {
            String categoryName = request.getParameter("category_name");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String dateCreated = dtf.format(LocalDateTime.now());
            String dateLastEdidted = dtf.format(LocalDateTime.now());
            int active = Integer.parseInt(request.getParameter("active"));

            Category newCategory = new Category();
            newCategory.setCategory_name(categoryName);
            newCategory.setDate_created(dateCreated);
            newCategory.setDate_last_edited(dateLastEdidted);
            newCategory.setActive(active);
            
            daoCategory.addCategory(newCategory);
            response.sendRedirect("manage-category");
        } else {
            doGet(request, response);
        }
    }
}
