/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import entity.Course;
import entity.FlashCard;
import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOResultDetail;
import model.DAOTypeOfPractice;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class editCourse extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editCourse</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editCourse at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String courseId_raw = request.getParameter("course_id");
        int courseId = Integer.parseInt(courseId_raw);
        
        DAOCourse daoCourse = new DAOCourse();
        DAOCategory daoCategory = new DAOCategory();
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        Course course = daoCourse.getCourseByCourseID(courseId);
        ArrayList<FlashCard> list = daoFlashCard.getQuizzByCouseID(courseId);   
        request.setAttribute("course", course);     
        request.setAttribute("list", list);     
        request.getRequestDispatcher("../view-mentor/manager-course/edit-course.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        DAOCourse daoCourse = new DAOCourse();
        String course_name = request.getParameter("course_name");
        String category_name = request.getParameter("category_name");
        String description = request.getParameter("description");        
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        
        String[] questions = request.getParameterValues("question");
        String[] answers = request.getParameterValues("answer");
        String[] imgs = request.getParameterValues("img");
        String[] flashcard_ids = request.getParameterValues("flashcard_id");
        
        DAOFlashCard daoFlashcard = new DAOFlashCard();

        for (int i = 0; i < questions.length; i++) {
            daoFlashcard.updateFlashCard(questions[i], answers[i],imgs[i],flashcard_ids[i]);
        }
        
        daoCourse.updateCourse(course_name,description,course_id);
        request.getRequestDispatcher("../view-mentor/mentor-dashboard.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
