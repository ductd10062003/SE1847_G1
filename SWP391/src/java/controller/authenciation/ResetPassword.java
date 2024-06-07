/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authenciation;

import controller.authenciation.encrypt.PasswordEncryptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;
import entity.User;

import java.io.IOException;

/**
 * @author ductd
 */
@WebServlet(name = "reset-password", urlPatterns = {"/reset-password"})
public class ResetPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = VerifyForgotPassword.getPendingUser(request.getSession().getId());
        if (user == null) {
            request.getSession().setAttribute("error", "Session expired. Please try again.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        String code = (String) request.getSession().getAttribute("code");
        String userCode = (String)request.getSession().getAttribute("user-code");
        if(userCode == null || code == null || !PasswordEncryptor.validatePassword(userCode, code)){
            request.getSession().setAttribute("error", "Invalid code");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        String password = request.getParameter("new-password");

        if(PasswordEncryptor.validatePassword(password, user.getPassword())){
            request.getSession().setAttribute("error", "New password must be different from the old one");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        user.setPassword(password);
        new DAOUser().updateUser(user);
        request.getSession().removeAttribute("code");
        request.getSession().removeAttribute("user-code");
        request.getSession().setAttribute("success", "Password has been reset successfully");
        request.getSession().setAttribute("user", user);
        
        request.getRequestDispatcher("ConfirmChangedPassword.jsp").forward(request, response);

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
