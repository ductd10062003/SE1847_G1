/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import com.google.gson.Gson;
import entity.FlashCard;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCategory;
import model.DAOFlashCard;

@WebServlet(name = "managerFlashCard", urlPatterns = {"/mentor/add-flashcard"})
public class addFlashCard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAOCategory daoCategory = new DAOCategory();

        request.setAttribute("categories", daoCategory.getAllCategories());
        request.getRequestDispatcher("../view-mentor/manager-flashcard/add-flashcard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] questions = request.getParameterValues("question[]");
        String[] answers = request.getParameterValues("answer[]");
        String[] imgs = request.getParameterValues("img[]");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Vector<FlashCard> flashcards = new Vector<>();
        int duplicate = 0;

        DAOFlashCard daoFlashcard = new DAOFlashCard();

        for (int i = 0; i < questions.length; i++) {
            FlashCard flashcard = new FlashCard(questions[i], answers[i], categoryId, imgs[i]);
            FlashCard fc = daoFlashcard.getFlashCardByQuestionNameAndCategory(questions[i], categoryId);
            if (fc != null) {
                flashcard.setQuestion(flashcard.getQuestion() + "@@err@@");
                duplicate = 1;
            }
            flashcards.add(flashcard);
        }
        if (duplicate == 0) {
            daoFlashcard.insertFlashCardsByList(flashcards);
            response.getWriter().print("00");
        } else {
            Gson gson = new Gson();
            response.getWriter().print(gson.toJson(flashcards));
        }
    }

}
