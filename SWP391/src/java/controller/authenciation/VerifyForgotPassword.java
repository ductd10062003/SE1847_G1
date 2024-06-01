/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package authenciation;

import controller.authenciation.encrypt.PasswordEncryptor;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author ductd
 */
@WebServlet(name = "verify-forgot-password", urlPatterns = {"/verify-forgot-password"})
public class VerifyForgotPassword extends HttpServlet {

    private static ConcurrentHashMap<String, User> pendingUsers = new ConcurrentHashMap<>();

    public static void addPendingUser(User user, String code) {

        pendingUsers.put(code, user);
        expirePendingUserThread(code);
    }

    public static User getPendingUser(String code){
        return pendingUsers.get(code);
    }

    private static void expirePendingUserThread(String code){
        new Thread(() -> {
            try {
                Thread.sleep(30000);
                pendingUsers.remove(code);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
    }

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

        User user = pendingUsers.get(request.getSession().getId());
        if(user == null){
            request.getSession().setAttribute("error", "Session expired. Please try again.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        String code = request.getParameter("verification-code");

        if(PasswordEncryptor.validatePassword(code, (String) request.getSession().getAttribute("code"))){
            request.getSession().setAttribute("user-code", code);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("error", "Invalid code");
            request.getRequestDispatcher("confirmResetPasswordVerificationCode.jsp").forward(request, response);
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
