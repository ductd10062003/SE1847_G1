/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class updateProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet updateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        User user = new User();
        user = (User) request.getSession().getAttribute("user");
        User list = daoUser.getUserByID(user.getUser_id());
        Vector<User> names = daoUser.getAllUsers();
        request.setAttribute("users", list);
        request.setAttribute("names", names);
        request.getRequestDispatcher("update-profile.jsp").forward(request, response);
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

        //Account a = (Account) session.getAttribute("account");
        int gender = request.getParameter("gender").equals("male") ? 1 : 0;
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String name = request.getParameter("username");
        String image = request.getParameter("image");
        String currentUsername = request.getParameter("currentUsername"); // Tên người dùng hiện tại

        //get the user from the session
        //upadte database
        DAOUser daoUser = new DAOUser();
        // Lấy danh sách tên người dùng đã tồn tại từ cơ sở dữ liệu
        ArrayList<String> existingUsernames = daoUser.getExistingUsernames(); // Ví dụ
        System.out.println("existingUsernames" + existingUsernames);

// Kiểm tra xem tên người dùng đã tồn tại
        if (existingUsernames.contains(name) && !name.equals(currentUsername)) {
            request.setAttribute("duplicateError", "Tên tài khoản đã tồn tại.Vui lòng nhập lại");
            doGet(request, response);
            return;
        }

// Nếu tên người dùng không tồn tại, thực hiện cập nhật hồ sơ
        User user = new User();
        user.setName(name);
        user.setGender(gender);
        user.setDob(dob);
        user.setPhone(phone);
        user.setImage(image);
        System.out.println(image);
        user = (User) request.getSession().getAttribute("user");
        int updateProfileResult = daoUser.updateProfile(name, gender, dob, phone,image, user.getUser_id());
        if (updateProfileResult > 0) {
            request.setAttribute("updateSuccess", "Cập nhật thông tin thành công.");
        } else {
            request.setAttribute("updateError", "Có lỗi xảy ra trong quá trình cập nhật.");
        }
//
//        user = (User) request.getSession().getAttribute("user");
//        int updateProfileResult = daoUser.updateProfile(name, gender, dob, phone, user.getUser_id());
//        if (updateProfileResult > 0) {
//            request.setAttribute("updateSuccess", "Cập nhật khóa học thành công.");
//        }
        doGet(request, response);
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
