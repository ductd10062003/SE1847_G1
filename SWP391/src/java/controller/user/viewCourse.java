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

        HttpSession session = request.getSession();

        String search = (String) session.getAttribute("course_name");
        String searchById = (String) session.getAttribute("category_id");
        ArrayList<Course> courses;
        ArrayList<Category> categories = daoCategory.getAllCategories2();

        if (search != null && searchById == null) {
            courses = daoCourse.getCourseByName2(search);
        } else if (search == null && searchById != null) {
            courses = daoCourse.getCouseByCategoryID(searchById);
        } else if (search != null && searchById != null) {
            courses = daoCourse.getCouseByCategoryIDandName(searchById, search);
        } else {
            courses = daoCourse.getAllCourses2();
        }

        request.setAttribute("course", courses);
        request.setAttribute("category", categories);

        paging(request, courses);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("course_name");
        String searchById = request.getParameter("category_id");
        // Tạo session
        HttpSession session = request.getSession();

        // Lưu tên người dùng vào 
        session.setAttribute("course_name", search);
        session.setAttribute("category_id", searchById);
        if ("0".equals(searchById)) {
            ArrayList<Course> listcourse = daoCourse.getAllCourses2();
            ArrayList<Category> category = daoCategory.getAllCategories2();
            request.setAttribute("course", listcourse);
            request.setAttribute("selected", searchById);
            request.setAttribute("category", category);
            paging(request, listcourse);
            session.setAttribute("selected", searchById);
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
        } else if (search != null && searchById == null) {
            String selected = (String) session.getAttribute("selected");
            ArrayList<Course> listcourse = null;
            if ("0".equals(selected) || selected == null) {
                listcourse = daoCourse.getCourseByName2(search);
            } else {
                listcourse = daoCourse.getCouseByCategoryIDandName(selected, search);
            }
            ArrayList<Category> category = daoCategory.getAllCategories2();
            request.setAttribute("course", listcourse);
            request.setAttribute("selected", selected);
            request.setAttribute("category", category);
            paging(request, listcourse);
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
        } else if (search == null && searchById != null) {
            ArrayList<Course> listcourse = daoCourse.getCouseByCategoryID(searchById);
            ArrayList<Category> category = daoCategory.getAllCategories2();
            request.setAttribute("course", listcourse);
            request.setAttribute("selected", searchById);
            request.setAttribute("category", category);
            paging(request, listcourse);
            session.setAttribute("selected", searchById);
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
        }
    }
}
