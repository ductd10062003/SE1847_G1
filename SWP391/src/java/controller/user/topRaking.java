    package controller.user;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import entity.Category;
import entity.ResultDetail;
import entity.TypeOfPractice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Vector;
import model.DAOCategory;
import model.DAOResultDetail;
import model.DAOTypeOfPractice;

/**
 *
 * @author DAT
 */
@WebServlet(urlPatterns = {"/topRaking"})
public class topRaking extends HttpServlet {

    private DAOResultDetail daoResult = new DAOResultDetail();
    private DAOCategory daoCategory = new DAOCategory();
    private DAOTypeOfPractice daoTypeOfPractice = new DAOTypeOfPractice();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<ResultDetail> list = daoResult.getTopRanking();
        Vector<TypeOfPractice> listC = daoTypeOfPractice.getAllTypeOfPractices();
        request.setAttribute("ranking", list);
        request.setAttribute("type", listC);
        request.getRequestDispatcher("/topRanking.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String value = request.getParameter("type");
        int numberInput = Integer.parseInt(value);
        
        if (numberInput == 0) {
            ArrayList<ResultDetail> list = daoResult.getTopRanking();
            request.setAttribute("ranking", list);
        }
        
        if (numberInput != 0) {
            ArrayList<ResultDetail> list = daoResult.getResultByTOP_ID(numberInput);
            request.setAttribute("ranking", list);
        }
        Vector<TypeOfPractice> listC = daoTypeOfPractice.getAllTypeOfPractices();
        request.setAttribute("type", listC);
        request.setAttribute("selected", value);
        request.getRequestDispatcher("/datatable.jsp").forward(request, response);
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
