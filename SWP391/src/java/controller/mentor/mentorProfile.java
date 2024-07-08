/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Course;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.DAOUser;
import model.DAOCourse;

/**
 *
 * @author DAT
 */
public class mentorProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
        DAOUser daoUser = new DAOUser();
        DAOCourse daoCourse = new DAOCourse();
        User user = new User();
        String name = request.getParameter("name");        
        User list = daoUser.getUserByUsername(name);
        ArrayList<Course> course = daoCourse.getCourseByUserName(name);
        request.setAttribute("course", course);       
        request.setAttribute("users", list);
        //paging(request, course);
        request.getRequestDispatcher("mentor-profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
