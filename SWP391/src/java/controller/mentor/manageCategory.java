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
import java.util.List;

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
            String filterBy = request.getParameter("filterBy");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            int page = 1;
            int pageSize = 8;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
            }

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
            } else if (keyword != null && !keyword.isEmpty()) {
                categories = daoCategory.getCategoriesByName(keyword);
            } else if (filterBy != null && !filterBy.isEmpty()) {
                categories = daoCategory.getCategoriesByDateRange(startDate, endDate, filterBy);
            } else {
                categories = daoCategory.getAllCategories();
            }

            int totalCategories = categories.size();
            int totalPages = (int) Math.ceil((double) totalCategories / pageSize);
            int fromIndex = (page - 1) * pageSize;
            int toIndex = Math.min(fromIndex + pageSize, totalCategories);
            Vector<Category> pageCategories = new Vector<>(categories.subList(fromIndex, toIndex));

            request.setAttribute("categories", pageCategories);
            request.setAttribute("keyword", keyword);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.setAttribute("filterBy", filterBy);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", pageSize);
            String queryString = request.getQueryString();
            request.setAttribute("queryString", queryString != null ? queryString.replaceAll("&?page=\\d*", "").replaceAll("&?pageSize=\\d*", "") : "");

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
            if (daoCategory.categoryExists(categoryName)) {
                request.setAttribute("errorMessage", "Tên danh mục đã tồn tại");
                request.setAttribute("categoryName", categoryName);
                request.getRequestDispatcher("../view-mentor/manager-category/add-category.jsp").forward(request, response);
            } else {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String dateCreated = dtf.format(LocalDateTime.now());
                String dateLastEdited = dtf.format(LocalDateTime.now());
                int active = Integer.parseInt(request.getParameter("active"));

                Category newCategory = new Category();
                newCategory.setCategory_name(categoryName);
                newCategory.setDate_created(dateCreated);
                newCategory.setDate_last_edited(dateLastEdited);
                newCategory.setActive(active);

                daoCategory.addCategory(newCategory);
                response.sendRedirect("manage-category");
            }
        } else {
            doGet(request, response);
        }
    }
}
