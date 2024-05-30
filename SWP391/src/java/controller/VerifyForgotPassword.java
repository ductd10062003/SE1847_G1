/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import controller.encrypt.Password;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;
import entity.User;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author ductd
 */
@WebServlet(name = "verify-forgot-password", urlPatterns = {"/verify-forgot-password"})
public class VerifyForgotPassword extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pending = request.getParameter("pending");
        if(pending != null){

            String newPassword = request.getParameter("new-password");
            String email = (String) request.getSession().getAttribute("email");
            
            User user = new DAOUser().getUserByEmail(email);
            if(Password.validatePassword(newPassword, user.getPassword())){
                request.getSession().setAttribute("error", "New password must be different from the old password");
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                return;
            }
            request.getSession().removeAttribute("email");
            request.getSession().removeAttribute("email");
            user.setPassword(newPassword);
            new DAOUser().updateUser(user);
            request.getSession().removeAttribute("user");
            response.sendRedirect("login");
            return;
        }


        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);

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
