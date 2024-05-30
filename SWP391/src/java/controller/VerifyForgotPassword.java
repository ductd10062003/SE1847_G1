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
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author ductd
 */
@WebServlet(name = "verify-forgot-password", urlPatterns = {"/verify-forgot-password"})
public class VerifyForgotPassword extends HttpServlet {
    private static ConcurrentHashMap<String, String> pendingUsers = new ConcurrentHashMap<>();

    public static void addPendingUser(String email, String code) {
        pendingUsers.put(code, email);
    }

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

        String pendingEmail = request.getParameter("email");
        if(pendingEmail != null){

            String newPassword = request.getParameter("new-password");
            User user = new DAOUser().getUserByEmail(pendingEmail);
            if(Password.validatePassword(newPassword, user.getPassword())){
                request.getSession().setAttribute("error", "New password must be different from the old password");
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                return;
            }
            request.getSession().removeAttribute("email");
            user.setPassword(newPassword);
            new DAOUser().updateUser(user);
            request.getSession().removeAttribute("user");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        String verificationCode = request.getParameter("verification-code");
        String email = pendingUsers.get(verificationCode);
        if (email == null) {
            request.getSession().setAttribute("error", "Invalid verification code");
            request.getRequestDispatcher("confirmResetPasswordVerificationCode.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("email", email);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);

        }

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
