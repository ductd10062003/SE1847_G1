/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package authenciation.authenciationAjax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "email-validation", urlPatterns = {"/email-validation"})
public class ValidateEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        boolean isAvailable = new DAOUser().getUserByEmail(email) == null;
        out.println(isAvailable ? "false" : "true");  // "true" means exists, "false" means available
        out.flush();
        out.close();
        System.out.println("Email:" + email + " availability " + (!isAvailable ? "true" : "false"));
    }
}
