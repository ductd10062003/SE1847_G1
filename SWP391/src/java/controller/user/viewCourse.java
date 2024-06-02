/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.Category;
import entity.Course;
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
import model.DAOUser;

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

        int page, numberpage = 6;
        int size = list.size();
        int num = (size % 6 == 0 ? (size / 6) : ((size / 6) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);
        ArrayList<Course> course = daoCourse.getListByCourse(list, start, end);
        request.setAttribute("course", course);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Course> list = daoCourse.getAllCourses2();
        request.setAttribute("course", list);
        ArrayList<Category> category = daoCategory.getAllCategories2();
        request.setAttribute("category", category);

        paging(request, list);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("course_name");
        System.out.println(search);

        if (search != null) {
            search = search.trim();
            ArrayList<Course> course = daoCourse.getCourseByName2(search);
            request.setAttribute("course", course);
            //paging(request, course);
        }
        
        
        String searchById = request.getParameter("category_id");
        System.out.println(searchById);
        if (searchById != null) {
            searchById = searchById.trim();
            ArrayList<Course> listcourse = new ArrayList<>();
            try {
                listcourse = daoCourse.getCouseByCategoryID(searchById);
            } catch (Exception e) {
                System.err.println("Y");
            }
            request.setAttribute("course", listcourse);
            //paging(request, listcourse);
        
        }
        ArrayList<Category> category = daoCategory.getAllCategories2();
        request.setAttribute("category", category);
        request.setAttribute("category_id", searchById);
        request.setAttribute("course_name", search); 
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }
}
