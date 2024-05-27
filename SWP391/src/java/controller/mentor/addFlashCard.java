/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Category;
import entity.FlashCard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Vector;
import model.DAOCategory;
import model.DAOFlashCard;

@WebServlet(name = "managerFlashCard", urlPatterns = {"/mentor/add-flashcard"})
public class addFlashCard extends HttpServlet {

    private DAOCategory daoCategory = new DAOCategory();
    private boolean checkDuplicate = false;

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
        String service = request.getParameter("service");
        if (service != null && service.trim().length() > 0) {
            switch (service) {
                case "searchCategory":
                    searchCategory(request, response);
                    return;
                case "createFlashCard":
                    Vector<FlashCard> vector = convertData(request, response);
                    if (checkDuplicate == true) {
                        checkDuplicate = false;
                        request.setAttribute("listFlashCard", vector);
                        request.setAttribute("categories", daoCategory.getAllCategories());
                        request.getRequestDispatcher("../view-mentor/manager-flashcard/add-flashcard.jsp").forward(request, response);
                    } else {
                        createFlashCard(request, response, vector);
                        response.sendRedirect("add-flashcard");
                    }
                    return;
            }
        }
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    private void createFlashCard(HttpServletRequest request, HttpServletResponse response, Vector<FlashCard> vector)
            throws ServletException, IOException {
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        daoFlashCard.insertFlashCardsByList(vector);
    }

    public Vector<FlashCard> convertData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOFlashCard daoFlashCard = new DAOFlashCard();

        String category_id = request.getParameter("category_id");
        String data = request.getParameter("data_flashcards");

        LocalDate today = LocalDate.now();

        Vector<FlashCard> vector = new Vector<>();
        Vector<String> checkDuplicateInVector = new Vector<>();
        String[] pair_raw = data.split("##notpair##");
        for (int i = 0; i < pair_raw.length; i++) {
            if (pair_raw[i].length() > 0) {
                String[] pair = pair_raw[i].split("@@pair@@");

                FlashCard fl = new FlashCard(pair[0], pair[1], today.toString(), today.toString(), 1, Integer.parseInt(category_id));

                FlashCard checkExist = daoFlashCard.getFlashCardByQuestionName(fl.getQuestion());

                if (checkExist != null) {
                    fl.setQuestion(fl.getQuestion() + "@@err@@");
                    checkDuplicate = true;
                }
                if (checkDuplicateInVector.isEmpty()) {
                    checkDuplicateInVector.add(fl.getQuestion());
                } else if (checkDuplicateInVector.contains(fl.getQuestion())) {
                    checkDuplicateInVector.add(fl.getQuestion());
                    fl.setQuestion(fl.getQuestion() + "@@err@@");
                    checkDuplicate = true;
                }
                vector.add(fl);
            }
        }
        return vector;
    }

}
