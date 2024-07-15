package controller.mentor;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOFlashCard;
import model.DAOCategory;
import entity.FlashCard;
import entity.Category;
import java.util.List;

@WebServlet(name = "manageFlashCard", urlPatterns = {"/mentor/manageFlashCard"})
public class manageFlashCard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOFlashCard daoFlashcard = new DAOFlashCard();
        DAOCategory daoCategory = new DAOCategory();
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            int flashcardId = Integer.parseInt(request.getParameter("id"));
            FlashCard flashcard = daoFlashcard.getFlashCardByID2(flashcardId);
            Vector<Category> categories = daoCategory.getAllCategories();
            request.setAttribute("flashcard", flashcard);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("../view-mentor/manager-flashcard/update-flashcard.jsp").forward(request, response);
        } else {
            String keyword = request.getParameter("keyword");
            String sortType = request.getParameter("sort");
            String filterBy = request.getParameter("filterBy");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            Integer categoryId = null; 

            if (request.getParameter("categoryId") != null && !request.getParameter("categoryId").isEmpty()) {
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
            }

            int page = 1;
            int pageSize = 6;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
            }

            Vector<FlashCard> flashcards;
            Vector<Category> categories = daoCategory.getAllCategories();
            if (sortType != null && !sortType.isEmpty()) {
                switch (sortType) {
                    case "newest_created":
                        flashcards = daoFlashcard.getFlashCardsSortedByNewestCreated();
                        break;
                    case "oldest_created":
                        flashcards = daoFlashcard.getFlashCardsSortedByOldestCreated();
                        break;
                    case "newest_edited":
                        flashcards = daoFlashcard.getFlashCardsSortedByNewestEdited();
                        break;
                    case "oldest_edited":
                        flashcards = daoFlashcard.getFlashCardsSortedByOldestEdited();
                        break;
                    default:
                        flashcards = daoFlashcard.getAllFlashCards();
                        break;
                }
            } else if (keyword != null && !keyword.isEmpty()) {
                flashcards = daoFlashcard.getFlashCardsByQuestion(keyword);
            } else if (categoryId != null) {
                flashcards = daoFlashcard.getAllFlashCardsByCategoryId(categoryId);
            } else {
                flashcards = daoFlashcard.getAllFlashCards();
            }

            int totalFlashcards = flashcards.size();
            int totalPages = (int) Math.ceil((double) totalFlashcards / pageSize);
            int fromIndex = (page - 1) * pageSize;
            int toIndex = Math.min(fromIndex + pageSize, totalFlashcards);
            Vector<FlashCard> pageFlashcards = new Vector<>(flashcards.subList(fromIndex, toIndex));

            request.setAttribute("flashcards", pageFlashcards);
            request.setAttribute("keyword", keyword);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.setAttribute("filterBy", filterBy);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("categories", categories);
            String queryString = request.getQueryString();
            request.setAttribute("queryString", queryString != null ? queryString.replaceAll("&?page=\\d*", "").replaceAll("&?pageSize=\\d*", "") : "");

            request.getRequestDispatcher("../view-mentor/manager-flashcard/view-flashcard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOFlashCard daoFlashcard = new DAOFlashCard();
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            int flashcardId = Integer.parseInt(request.getParameter("flashcard_id"));
            String question = request.getParameter("question");
            String answer = request.getParameter("answer");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String dateLastEdited = dtf.format(LocalDateTime.now());
            int active = Integer.parseInt(request.getParameter("active"));
            int categoryID = Integer.parseInt(request.getParameter("category_id"));
            String image = request.getParameter("image");

            FlashCard flashcard = new FlashCard(flashcardId, question, answer, null, dateLastEdited, active, categoryID, image);
            daoFlashcard.updateFlashcard(flashcard);
            response.sendRedirect("manageFlashCard");
        } else {
            doGet(request, response);
        }
    }
}
