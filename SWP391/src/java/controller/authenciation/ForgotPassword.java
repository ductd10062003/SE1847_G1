/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authenciation;

import controller.authenciation.encrypt.GmailVerificationHandler;
import controller.authenciation.encrypt.PasswordEncryptor;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;

/**
 * @author ductd
 */
@WebServlet(name = "forgot-password", urlPatterns = {"/forgot-password"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = new DAOUser().getUserByEmail(email);

        if (user == null) {
            request.getSession().setAttribute("error", "Email is not existed");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }

        if (user.getActive() == 0) {
            request.getSession().setAttribute("error", "Account is not activated");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }

        String code;
        code = PasswordEncryptor.generateSalt().substring(0, 6);
        request.getSession().setAttribute("code", PasswordEncryptor.generateSecurePassword(code));

        GmailVerificationHandler.sendResetPasswordVerificationCode(email, code);

        VerifyForgotPassword.addPendingUser(user, request.getSession().getId());

        request.getSession().setAttribute("username", user.getName());
        request.getRequestDispatcher("confirmResetPasswordVerificationCode.jsp").forward(request, response);
    }

}
