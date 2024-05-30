/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import entity.Course;
import model.DAOCourse;
import entity.Category;
import model.DAOCategory;
/**
 *
 * @author DANGTRUONG
 */
@WebServlet(name = "courseEnroll", urlPatterns = {"/courseEnroll"})
public class courseEnroll extends HttpServlet {
    private static final int ITEMS_PER_PAGE = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String user_id = request.getParameter("user_id");
//        HttpSession session = request.getSession();
//        String user_id = (String) session.getAttribute("user_id");
        String user_id = "1";

        if (user_id == null || user_id.isEmpty()) {
            response.sendRedirect("login.html");
            return;
        }

        DAOCourse daoCourse = new DAOCourse();
        DAOCategory daoCategory = new DAOCategory();
        
        Vector<Course> courses;
         Vector<Category> categories = daoCategory.getAllCategories();

        String courseName = request.getParameter("courseName");
        String categoryName = request.getParameter("categoryName");
        String pageStr = request.getParameter("page");
        int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);
        int offset = (page - 1) * ITEMS_PER_PAGE;
        
         if (courseName != null && !courseName.isEmpty()) {
            // Lọc theo tên khóa học nếu có
            courses = daoCourse.searchEnrolledCoursesByName(user_id, courseName, offset, ITEMS_PER_PAGE);
        } else if (categoryName != null && !categoryName.isEmpty()) {
            // Lọc theo danh mục nếu có
            courses = daoCourse.getEnrolledCoursesByCategory(user_id, categoryName, offset, ITEMS_PER_PAGE);
        } else {
            // Lấy tất cả các khóa học đã đăng ký nếu không có lọc
            courses = daoCourse.searchUserEnrollCourse(user_id, offset, ITEMS_PER_PAGE);;
        }
        
        int totalCourses = daoCourse.getAllCourses().size();
        int totalPages = (int) Math.ceil((double) totalCourses / ITEMS_PER_PAGE);
         
        request.setAttribute("categories", categories);
        request.setAttribute("courses", courses);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("course-enroll.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
