/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCategory;

@WebServlet(name = "managerFlashCard", urlPatterns = {"/mentor/add-flashcard"})
public class managerFlashCard extends HttpServlet {

    private DAOCategory daoCategory = new DAOCategory();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("categories", daoCategory.getAllCategories());
        request.getRequestDispatcher("../view-mentor/manager-flashcard/add-flashcard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String searchValue = request.getParameter("category_name").trim();
        Vector<Category> vetor = daoCategory.getCategoriesByName(searchValue);
        if (vetor != null) {
            for (Category c : vetor) {
                response.getWriter().print("<div class=\"form-check\">\n"
                        + "                                                        <input\n"
                        + "                                                            class=\"form-check-input\"\n"
                        + "                                                            type=\"radio\"\n"
                        + "                                                            name=\"category\"\n"
                        + "                                                            id=\"flexRadioDefault1\"\n"
                        + "                                                            value=\"" + c.getCategory_id() + "\"\n"
                        + "                                                            />\n"
                        + "                                                        <label\n"
                        + "                                                            class=\"form-check-label\"\n"
                        + "                                                            for=\"category\"\n"
                        + "                                                            >\n"
                        + "                                                            " + c.getCategory_name() + "\n"
                        + "                                                        </label>\n"
                        + "                                                    </div>");
            }
        }

    }

}
