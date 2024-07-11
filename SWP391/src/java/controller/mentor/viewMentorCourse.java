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
import model.DAOCourse;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class viewMentorCourse extends HttpServlet {

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
        int numberPerPage = 6; // Số mục trên mỗi trang
        int size = list.size();
        int numPages = (size + numberPerPage - 1) / numberPerPage; // Tính số trang

        // Lấy tham số trang từ request
        String xpage = request.getParameter("page");
        if (xpage == null || xpage.isEmpty()) {
            page = 1; // Nếu không có tham số trang, đặt trang mặc định là 1
        } else {
            try {
                page = Integer.parseInt(xpage);
                if (page < 1 || page > numPages) {
                    page = 1; // Đảm bảo trang nằm trong khoảng hợp lệ
                }
            } catch (NumberFormatException e) {
                page = 1; // Xử lý ngoại lệ nếu tham số trang không hợp lệ
            }
        }

        // Tính vị trí bắt đầu và kết thúc của mục trên trang hiện tại
        int start = (page - 1) * numberPerPage;
        int end = Math.min(start + numberPerPage, size);

        // Lấy danh sách các mục trong phạm vi trang hiện tại
        ArrayList<Course> pagedCourses = new ArrayList<>(list.subList(start, end));

        // Đặt các thuộc tính vào request để truyền tới JSP
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
        user = (User) request.getSession().getAttribute("user");
        User list = daoUser.getUserByUsername(user.getName());
        ArrayList<Course> course = daoCourse.getCourseByUserName(user.getName());
        request.setAttribute("course", course);
        request.setAttribute("users", list);
        paging(request, course);
        request.getRequestDispatcher("view-course.jsp").forward(request, response);
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
