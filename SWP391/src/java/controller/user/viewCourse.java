/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.Category;
import entity.Course;
import entity.FlashCard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOTypeOfPractice;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class viewCourse extends HttpServlet {
    
    private DAOCourse daoCourse = new DAOCourse();
    private boolean checkDuplicate = false;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        ArrayList<Course> course = daoCourse.getAllCourses();
        System.out.println(course);
        request.setAttribute("course", course);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String service = request.getParameter("service");
        if (service != null && service.trim().length() > 0) {
            switch (service) {
                case "searchCourse":
                    //searchCourse(request, response);
                    return;            
            }
        }
    }
//    private void searchCourse(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String searchValue = request.getParameter("category_name").trim();
//        Course course = daoCourse.getCourseByName(searchValue);
//        if (course != null) {
//            for (Course c : course) {
//                response.getWriter().print("<div class=\"form-check\">\n"
//                        + "                                                        <input\n"
//                        + "                                                            class=\"form-check-input\"\n"
//                        + "                                                            type=\"radio\"\n"
//                        + "                                                            name=\"category\"\n"
//                        + "                                                            id=\"flexRadioDefault1\"\n"
//                        + "                                                            value=\"" + c.getCourse_id() + "\"\n"
//                        + "                                                            />\n"
//                        + "                                                        <label\n"
//                        + "                                                            class=\"form-check-label\"\n"
//                        + "                                                            for=\"category\"\n"
//                        + "                                                            >\n"
//                        + "                                                            " + c.getCourse_name() + "\n"
//                        + "                                                        </label>\n"
//                        + "                                                    </div>");
//            }
//        }
//    }
}
