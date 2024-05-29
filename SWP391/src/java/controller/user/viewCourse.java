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
import java.util.List;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Course> list = daoCourse.getAllCourses();       
        request.setAttribute("course", list);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
//        int page,numberpage=4;
//        int size=list.size();
//        int num=(size%4==0?(size/4):((size/4)+1));
//        String xpage=request.getParameter("page");
//        if(xpage==null){
//            page=1;
//        }else{
//            page=Integer.parseInt(xpage);
//        }
//        int start,end;
//        start=(page-1)*numberpage;
//        end=Math.min(page*numberpage,size);
//        ArrayList<Course> course=daoCourse.getListByCourse(list,start,end);      
//        request.setAttribute("date", course);
//        request.setAttribute("page", page);
//        request.setAttribute("num", num);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("course_name").trim();
        System.out.println(search);
        
        if (search != null) {
            ArrayList<Course> course = daoCourse.getCourseByName(search);
            request.setAttribute("course", course);
        }   
        request.setAttribute("course_name", search);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }
}
