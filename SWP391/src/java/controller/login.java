/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

/**
 *
 * @author ductd
 */
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get input
        String email = request.getParameter("username");
        String password = request.getParameter("password");        
        //Get user
        try {
            DAOUser daoUser = new DAOUser();
//            User user = daoUser.getUser(email, password);
//            if(user == null)
//                throw new Exception("Tài khoản không tồn tại");
            
        } catch (Exception e) {
            request.setAttribute("err", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
