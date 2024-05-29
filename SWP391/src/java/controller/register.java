/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;

/**
 *
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
//        get the date of birth, phone, gender
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        int gender = request.getParameter("gender").equals("male") ? 1 : 0;
//        if the password and confirm-password are not the same, set the error message and forward to register page
        if (!password.equals(confirmPassword)) {
            request.getSession().setAttribute("error", "Password and confirm password are not the same");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
//            if the username is already existed, set the error message and forward to register page
            if (new DAOUser().getUserByUsername(username) != null) {
                request.getSession().setAttribute("error", "Username is already existed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
//                if the email is already existed, set the error message and forward to register page
                if (new DAOUser().getUserByEmail(email) != null) {
                    request.getSession().setAttribute("error", "Email is already existed");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
//                    if the username and email are not existed, create a new user and set the user to the session, then redirect to home page
                    new DAOUser().createUser(username, email, password, dob, phone, gender);
                    request.getSession().setAttribute("user", new DAOUser().getUserByUsername(username));
                    response.sendRedirect("login");
                }
            }
        }
    }

}
