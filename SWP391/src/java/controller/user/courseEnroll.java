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
import entity.User;
import model.DAOCategory;

/**
 *
 * @author DANGTRUONG
 */
@WebServlet(name = "courseEnroll", urlPatterns = {"/courseEnroll"})
public class courseEnroll extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String user_id = request.getParameter("user_id");
//        HttpSession session = request.getSession();
//        String user_id = (String) session.getAttribute("user_id");

//        String user_id = "1";
//
//        if (user_id == null || user_id.isEmpty()) {
//            response.sendRedirect("login");
//            return;
//        }
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String user_id = String.valueOf(user.getUser_id());

        DAOCourse daoCourse = new DAOCourse();
        DAOCategory daoCategory = new DAOCategory();

        Vector<Course> courses;
        Vector<Category> categories = daoCategory.getAllCategories();

        String courseName = request.getParameter("courseName");
        String[] categoryNames = request.getParameterValues("categoryName");

        int page = 1;
        int pageSize = 6;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }

        if (courseName != null && !courseName.isEmpty()) {
            courses = daoCourse.searchEnrolledCoursesByName(user_id, courseName);
        } else if (categoryNames != null && categoryNames.length > 0) {
            courses = daoCourse.getEnrolledCoursesByCategories(user_id, categoryNames);
        } else {
            courses = daoCourse.searchUserEnrollCourse(user_id);
        }

        int totalCourses = courses.size();
        int totalPages = (int) Math.ceil((double) totalCourses / pageSize);
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, totalCourses);
        Vector<Course> pageCourses = new Vector<>(courses.subList(fromIndex, toIndex));

        request.setAttribute("categories", categories);
        request.setAttribute("courses", pageCourses);
        request.setAttribute("courseName", courseName);
        request.setAttribute("categoryNames", categoryNames);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        String queryString = request.getQueryString();
        request.setAttribute("queryString", queryString != null ? queryString.replaceAll("&?page=\\d*", "").replaceAll("&?pageSize=\\d*", "") : "");
        request.getRequestDispatcher("course-enroll.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
