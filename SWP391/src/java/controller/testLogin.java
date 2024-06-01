/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

/**
 *
 * @author ductd
 */
@WebServlet(name = "testLogin", urlPatterns = {"/testLogin"})
public class testLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service != null) {
            login(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            DAOUser daoUser = new DAOUser();
            User user = daoUser.testLogin(email, password);
            if(user == null) throw new Exception("Tài khoản không tồn tại");
            request.getSession(true).setAttribute("user", user);
            int role = user.getRole();
            switch (role) {
                case 1 -> response.sendRedirect("admin");
                case 2 -> response.sendRedirect("mentor/dashboard");
                case 3 -> response.sendRedirect("course-detail");
            }
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }

    }

}
