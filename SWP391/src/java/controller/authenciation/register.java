/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package authenciation;

import controller.authenciation.encrypt.GmailVerificationHandler;
import controller.authenciation.encrypt.PasswordEncryptor;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author ductd
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        if logged in already, logout the session
        if (request.getSession().getAttribute("user") != null) {
            request.getSession().removeAttribute("user");
        }
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        get the username, email, password, confirm-password
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        int role = Integer.parseInt(request.getParameter("role"));
//        get the date of birth, phone, gender
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        int gender = request.getParameter("gender").equals("male") ? 1 : 0;
//            if the username is already existed, set the error message and forward to register page

//                    if the username and email are not existed, create a new user and set the user to the session, then redirect to home page
        //User(int user_id, String name, String email, String password, int role, int active, String create_at, int gender, String dob, String phone, String image)
        User user = new User(0, username, email, password, role, 1, java.time.LocalDate.now().toString(), gender, dob, phone, "");

        String OTP = PasswordEncryptor.generateSalt();

        GmailVerificationHandler.sendCreateAccountVerificationCode(email, OTP);

        VerifyAccount.addPendingUser(user, request.getSession().getId());
        request.getSession().setAttribute("OTP", PasswordEncryptor.generateSecurePassword(OTP));

        request.getRequestDispatcher("ConfirmVerificationCode.jsp").forward(request, response);


    }
}


