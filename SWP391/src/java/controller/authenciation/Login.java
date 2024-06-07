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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class Login extends HttpServlet {


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
        //check if the user logged on already
        if (request.getSession().getAttribute("user") != null)
            request.getSession().removeAttribute("user");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        // If there is username, password in the request, get the user by username. If the password is correct then set the user to the session and redirect to home page
        // If the password is incorrect, set the error message and forward to login page
        // If there is no username, password in the request, forward to login page
        // If the user is already logged in, redirect to home page
        // If the user is not found, set the error message and forward to login page
        // If there is any exception, set the error message and forward to login page

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("home");
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null) {
                User user = new DAOUser().getUserByUsername(username);
                if (user != null) {
                    if (PasswordEncryptor.validatePassword(password, user.getPassword())) {
                        request.getSession().setAttribute("user", user);
                        response.sendRedirect("index.jsp");
                    } else {
                        request.getSession().setAttribute("error", "Password is incorrect");
                        request.getSession().setAttribute("username", username);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }

                } else {
                    request.getSession().setAttribute("error", "Username user not exist");
                    request.getSession().setAttribute("username", username);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.getSession().setAttribute("error", "Username and password are required");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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