/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.practice;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ductd
 */
@WebServlet(name="matching", urlPatterns={"/matching"})
public class matching extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int user_practice_id = Integer.parseInt(request.getParameter("user_practice_id"));
        if(user == null){
            response.sendRedirect("course-detail?course_id="+courseId);
            return;
        }
        request.setAttribute("course_id", courseId);
        request.setAttribute("user_practice_id", user_practice_id);
        request.getRequestDispatcher("practice/matching.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}
