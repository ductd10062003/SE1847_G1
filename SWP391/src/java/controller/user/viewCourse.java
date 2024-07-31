/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.Category;
import entity.Course;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.DAOCategory;
import model.DAOCourse;

/**
 *
 * @author DAT
 */
public class viewCourse extends HttpServlet {

    private DAOCourse daoCourse = new DAOCourse();
    private DAOCategory daoCategory = new DAOCategory();
    public boolean checkDuplicate = false;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void paging(HttpServletRequest request, ArrayList<Course> list) {

        int page;
        int numberPage = 6; // Số mục trên mỗi trang
        int size = list.size();
        int numPages = (size + numberPage - 1) / numberPage; // Tính số trang

        String xpage = request.getParameter("page");
        if (xpage == null || xpage.isEmpty()) {
            page = 1; // Nếu không có tham số trang, đặt trang mặc định là 1
        } else {
            try {
                page = Integer.parseInt(xpage);
            } catch (NumberFormatException e) {
                page = 1; // Đặt trang mặc định là 1 nếu tham số không hợp lệ
            }
        }

        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);

        ArrayList<Course> pagedCourses = new ArrayList<>(list.subList(start, end));
        request.setAttribute("course", pagedCourses);
        request.setAttribute("page", page);
        request.setAttribute("numPages", numPages);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("course_name");
        String searchById = request.getParameter("category_id");
                         
        List<Course> courses = null;
        List<Category> categories = null;

        try {
            categories = daoCategory.getAllCategories2();
            // Retrieve all categories
            if ("0".equals(searchById)) {
                if (search != null && !search.isEmpty()) {
                    // Retrieve courses based on search course_name
                    courses = daoCourse.getCourseByName2(search);
                } else {
                    // Retrieve all courses when no search parameter provided
                    courses = daoCourse.getAllCourses2();
                }
            } else if (search != null && !search.isEmpty() && (searchById == null || searchById.isEmpty())) {
                // Retrieve courses based on search course_name
                courses = daoCourse.getCourseByName2(search);
            } else if (searchById != null && !searchById.isEmpty() && (search == null || search.isEmpty())) {
                // Retrieve courses based on select category_id
                courses = daoCourse.getCouseByCategoryID(searchById);
            } else if (search != null && !search.isEmpty() && searchById != null && !searchById.isEmpty()) {
                // Retrieve courses based on search course_name and select category_id
                courses = daoCourse.getCouseByCategoryIDandName(searchById, search);
            } else {
                // If no search parameters are provided, retrieve all courses
                courses = daoCourse.getAllCourses2();
            }
            request.setAttribute("course", courses);
            request.setAttribute("category", categories);
            // Set attributes in request for rendering in JSP           
            paging(request, (ArrayList<Course>) courses);
            // Set up pagination (assuming this method exists and is correctly implemented)          
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
            // Forward to courses.jsp for rendering          
        } catch (Exception e) {
            // Handle any exceptions that occur
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request.");
            // For debugging purposes; replace with appropriate error handling
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            // Optionally, forward to an error page or set an error message attribute
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Retrieve search parameters from the form
        String search = request.getParameter("course_name");
        String searchById = request.getParameter("category_id");
        // Initialize session
        HttpSession session = request.getSession();
        // Store search parameters in session
        session.setAttribute("course_name", search);
        session.setAttribute("category_id", searchById);
        // Retrieve all categories
        List<Category> categories = daoCategory.getAllCategories2();
        // Initialize courses list
        List<Course> courses = null;
        // Handle different cases based on search parameters
        if ("0".equals(searchById)) {
            // Retrieve all courses when category_id is "0"
            courses = daoCourse.getAllCourses2();
        } else if (search != null && searchById == null) {
            // Retrieve courses by name if only course_name is provided
            String selected = (String) session.getAttribute("selected");
            if ("0".equals(selected) || selected == null) {
                courses = daoCourse.getCourseByName2(search);
            } else {
                courses = daoCourse.getCouseByCategoryIDandName(selected, search);
            }
        } else if (search == null && searchById != null) {
            // Retrieve courses by category_id if only category_id is provided
            courses = daoCourse.getCouseByCategoryID(searchById);
        }
        // Set attributes in request for rendering in JSP
        request.setAttribute("course", courses);
        request.setAttribute("category", categories);
        // Set up pagination (assuming this method exists and is correctly implemented)
        paging(request, (ArrayList<Course>) courses);
        // Forward to courses.jsp for rendering
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }
}
