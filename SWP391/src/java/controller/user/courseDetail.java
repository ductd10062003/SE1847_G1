/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import entity.Course;
import entity.FlashCard;
import entity.User;
import entity.UserEnrollCourse;
import entity.UserPractice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOResultDetail;
import model.DAOTypeOfPractice;
import model.DAOUser;
import model.DAOUserEnrollCourse;
import model.DAOUserPractice;

@WebServlet(name = "course-detail", urlPatterns = {"/course-detail"})
public class courseDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

//        int course_id = Integer.parseInt(request.getParameter("course_id"));
        // thử course 
        int course_id = 2;
        //Thành phần DAO
        DAOTypeOfPractice daoTypeOfPractices = new DAOTypeOfPractice();
        DAOCourse daoCourse = new DAOCourse();
        DAOUser daoUser = new DAOUser();
        DAOCategory daoCategory = new DAOCategory();
        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOUserEnrollCourse daoUserEnrollCourse = new DAOUserEnrollCourse();

//        session.setAttribute("member", daoUser.getUserByID(1));
        //Object
        Course course = daoCourse.getCourseByID(course_id);
        User user = null;
        UserEnrollCourse userEnrollCourse = null;
        if ((User) session.getAttribute("member") != null) {
            user = (User) session.getAttribute("member");
            userEnrollCourse = daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), course_id);
        }
     
        //
        if (userEnrollCourse == null || userEnrollCourse.getStatus() == 0) {
            request.setAttribute("enrolled", 0);
        }
        request.setAttribute("course", course);
        request.setAttribute("mentor", daoUser.getUserByID(course.getCreated_by()));
        request.setAttribute("typeOfPractices", daoTypeOfPractices.getAllTypeOfPractices());
        request.setAttribute("quizs", daoFlashCard.getFlashCardByCourse(daoQuiz.getQuizsByCourseID(course_id)));
        request.setAttribute("category", daoCategory.getCategoryByID(course.getCategory_id()));
        request.getRequestDispatcher("course-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int course_id = Integer.parseInt(request.getParameter("course_id"));
        String service = request.getParameter("service");
        int course_id = 5;

        User user = (User) request.getSession(true).getAttribute("member");

        if (service != null && service.trim().length() != 0) {
            switch (service) {
                case "nextFL":
                    DAOQuiz daoQuiz = new DAOQuiz();
                    DAOFlashCard daoFlashCard = new DAOFlashCard();

                    Vector<FlashCard> flashcards = daoFlashCard.getFlashCardByCourse(daoQuiz.getQuizsByCourseID(course_id));
                    nextFL(response, request, flashcards);
                    return;
                case "joinClass":
                    DAOUserEnrollCourse daoUERC = new DAOUserEnrollCourse();
                    DAOUserPractice daoUP = new DAOUserPractice();
                    DAOResultDetail daoRD = new DAOResultDetail();

                    if (daoUERC.getUserEnrollCourse(user.getUser_id(), course_id) != null) {
                        try {
                            int updateUserEnrollCourse = daoUERC.updateUserEnrollCourse(user.getUser_id(), course_id, 1);
                            if (updateUserEnrollCourse == 0) {
                                throw new Exception();
                            }
                        } catch (Exception e) {
                            response.getWriter().print("error");
                        }
                    } else {
                        try {

                            int createUserEnrollCourse = daoUERC.createUserEnrollCourse(user.getUser_id(), course_id);
                            if (createUserEnrollCourse == 0) {
                                throw new Exception();
                            }

                            int createUserPractice = daoUP.createUserPractice(user.getUser_id(), course_id);
                            if (createUserPractice == 0) {
                                throw new Exception();
                            }
                            for (UserPractice i : daoUP.getUserPracticeByUserIdAndCourseId(user.getUser_id(), course_id)) {
                                int createResultDetail = daoRD.createResultDetail(i.getUserPractice_id());
                                if (createResultDetail == 0) {
                                    throw new Exception();
                                }
                            }

                        } catch (Exception e) {
                            response.getWriter().print("error");
                        }
                    }

                    response.sendRedirect("course-detail");
                    return;
                case "removeClass":
                    DAOUserEnrollCourse daoUERCRemove = new DAOUserEnrollCourse();
                    try {
                        int updateUserEnrollCourse = daoUERCRemove.updateUserEnrollCourse(user.getUser_id(), course_id, 0);
                        if (updateUserEnrollCourse == 0) {
                            throw new Exception();
                        }
                    } catch (Exception e) {
                        response.getWriter().print("error");
                    }
                    response.sendRedirect("course-detail");
                    return;
            }
        }
    }

    private void nextFL(HttpServletResponse response, HttpServletRequest request, Vector<FlashCard> flashcards) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.getWriter().print("<div\n"
                + "                                    class=\"card-body d-flex justify-content-center align-items-center w-75 h-100\"\n"
                + "                                    onclick=\"flip(this, `" + flashcards.get(id) + "`)\";\n"
                + "                                    >\n"
                + "                                    <p\n"
                + "                                        class=\"text-center fs-4\"\n"
                + "                                        style=\"overflow-y: auto; max-height: 100%\"\n"
                + "                                        >\n"
                + "                                        " + flashcards.get(id).getQuestion() + "\n"
                + "                                    </p>\n"
                + "                                </div>");
    }

}
