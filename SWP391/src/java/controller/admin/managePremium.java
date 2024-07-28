/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOPremium;

/**
 *
 * @author ductd
 */
@WebServlet(name="managePremium", urlPatterns={"/admin/manage-premium"})
public class managePremium extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAOPremium dao = new DAOPremium();
        
        request.setAttribute("premiums", dao.getAllPremium());
        request.getRequestDispatcher("../admin/managePremium.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String active = request.getParameter("active");
        String id = request.getParameter("id");
        
        DAOPremium dao = new DAOPremium();
        dao.updatePremium(name, Double.parseDouble(price), Integer.parseInt(active), Integer.parseInt(id));
        response.getWriter().print(name + price + active + id);
    }



}
