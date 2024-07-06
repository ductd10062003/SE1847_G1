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


@WebServlet(name="courseCompleted", urlPatterns={"/courseCompleted"})
public class courseCompleted extends HttpServlet {
    
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
        
         if (courseName != null && !courseName.isEmpty()) {
            courses = daoCourse.searchCompletedCoursesByName(user_id, courseName);
        } else if (categoryName != null && !categoryName.isEmpty()) {
            courses = daoCourse.getCompletedCoursesByCategory(user_id, categoryName);
        } else {
            courses = daoCourse.getCompletedCourses(user_id);
        }
         
        request.setAttribute("categories", categories);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("course-completed.jsp").forward(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}
