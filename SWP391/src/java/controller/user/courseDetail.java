/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.Course;
import entity.FlashCard;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOTypeOfPractice;
import model.DAOUser;

@WebServlet(name = "course-detail", urlPatterns = {"/course-detail"})
public class courseDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String course_id_raw = request.getParameter("courese_id");
        // thử course = 1
        int course_id = 1;
        DAOTypeOfPractice daoTypeOfPractices = new DAOTypeOfPractice();
        DAOCourse daoCourse = new DAOCourse();
        DAOUser daoUser = new DAOUser();
        DAOCategory daoCategory = new DAOCategory();
        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();

        Course course = daoCourse.getCourseByID(course_id);

        request.setAttribute("course", course);
        request.setAttribute("mentor", daoUser.getUserByID(course.getCreated_by()));
        request.setAttribute("typeOfPractices", daoTypeOfPractices.getAllTypeOfPractices());
        request.setAttribute("quizs", daoFlashCard.getFlashCardByCourse(daoQuiz.getQuizsByCourseID(course_id)));
        request.setAttribute("category", daoCategory.getCategoryByID(course.getCategory_id()));
        request.getRequestDispatcher("course-detail.jsp").forward(request, response);
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int course_id = 1;
//        DAOTypeOfPractice daoTypeOfPractices = new DAOTypeOfPractice();
//        DAOCourse daoCourse = new DAOCourse();
//
//        DAOQuiz daoQuiz = new DAOQuiz();
//        DAOFlashCard daoFlashCard = new DAOFlashCard();
//
//        String service = request.getParameter("service").trim();
//        if (service != null && service.length() != 0) {
//            if (service.equals("show")) {
//                for (FlashCard fl : daoFlashCard.getFlashCardByCourse(daoQuiz.getQuizsByCourseID(course_id))) {
//                    response.getWriter().print("<div\n"
//                            + "                                class=\"border container-fluid d-flex shadow-sm p-3 mb-2 bg-body-tertiary rounded\"\n"
//                            + "                                >\n"
//                            + "                                <div class=\"border-end\" style=\"width: 40%\">\n"
//                            + "                                    " + fl.getQuestion() + "\n"
//                            + "                                </div>\n"
//                            + "                                <div class=\"ps-4\" style=\"width: 60%\">" + fl.getAnswer() + "</div>\n"
//                            + "                            </div>");
//                }
//            } else if (service.equals("nextFL")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//
//                Vector<FlashCard> flashcards = daoFlashCard.getFlashCardByCourse(daoQuiz.getQuizsByCourseID(course_id));
//                response.getWriter().print("<div\n"
//                        + "                                    class=\"card-body d-flex justify-content-center align-items-center w-75 h-100\"\n"
//                        + "                                    onclick=\"flip(this, `" + flashcards.get(id) + "`)\";\n"
//                        + "                                    >\n"
//                        + "                                    <p\n"
//                        + "                                        class=\"text-center fs-4\"\n"
//                        + "                                        style=\"overflow-y: auto; max-height: 100%\"\n"
//                        + "                                        >\n"
//                        + "                                        " + flashcards.get(id).getQuestion() + "\n"
//                        + "                                    </p>\n"
//                        + "                                </div>");
//            }
//        }
//
//    }

    private void showFlashCard(HttpServletResponse response, Vector<FlashCard> flashcards) throws ServletException, IOException {
        for(FlashCard flashcard : flashcards){
            
        }
    }

}
