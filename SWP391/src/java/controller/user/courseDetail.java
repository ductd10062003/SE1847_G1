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

// DucTD-HE176150
@WebServlet(name = "course-detail", urlPatterns = {"/course-detail"})
public class courseDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // user account
        HttpSession session = request.getSession(true);
        

//        int course_id = Integer.parseInt(request.getParameter("course_id"));
        // thử course 
        int course_id = 3;
        //Thành phần DAO
        DAOTypeOfPractice daoTypeOfPractices = new DAOTypeOfPractice();
        DAOCourse daoCourse = new DAOCourse();
        DAOUser daoUser = new DAOUser();
        DAOCategory daoCategory = new DAOCategory();
        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOUserEnrollCourse daoUserEnrollCourse = new DAOUserEnrollCourse();

        //Object
        Course course = daoCourse.getCourseByID(course_id);
        //check user login
//        session.setAttribute("member", daoUser.getUserByID(1));
        //
        User user = null;
        UserEnrollCourse userEnrollCourse = null;
        if ((User) session.getAttribute("member") != null) {
            user = (User) session.getAttribute("member");
            userEnrollCourse = daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), course_id);
        }

        // check user enroll course.
        if (userEnrollCourse == null || userEnrollCourse.getStatus() == 0) {
            request.setAttribute("enrolled", 0);
        }

        request.setAttribute("course", course);
        request.setAttribute("mentor", daoUser.getUserByID(course.getCreated_by()));
        request.setAttribute("typeOfPractices", daoTypeOfPractices.getAllTypeOfPractices());
        request.setAttribute("quizs", daoFlashCard.getFlashCardInCourse(daoQuiz.getQuizsByCourseID(course_id)));
        request.setAttribute("category", daoCategory.getCategoryByID(course.getCategory_id()));
        request.getRequestDispatcher("course-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service != null && service.trim().length() != 0) {
            switch (service) {
                case "nextFL":
                    nextFL(response, request);
                    return;
                case "joinClass":
                    joinClass(response, request);
                    return;
                case "removeClass":
                    removeClass(response, request);
                    return;
            }
        }
    }

    private void nextFL(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();

        Vector<FlashCard> flashcards = daoFlashCard.getFlashCardInCourse(daoQuiz.getQuizsByCourseID(courseId));
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

    private void joinClass(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        DAOUserEnrollCourse daoUERC = new DAOUserEnrollCourse();
        DAOUserPractice daoUP = new DAOUserPractice();
        DAOResultDetail daoRD = new DAOResultDetail();

        User user = (User) request.getSession(true).getAttribute("member");

        if (daoUERC.getUserEnrollCourse(user.getUser_id(), courseId) != null) {
            try {
                int updateUserEnrollCourse = daoUERC.updateUserEnrollCourse(user.getUser_id(), courseId, 1);
                if (updateUserEnrollCourse == 0) {
                    throw new Exception();
                }
            } catch (Exception e) {
                response.getWriter().print("error");
            }
        } else {
            try {

                int createUserEnrollCourse = daoUERC.createUserEnrollCourse(user.getUser_id(), courseId);
                if (createUserEnrollCourse == 0) {
                    throw new Exception();
                }

                int createUserPractice = daoUP.createUserPractice(user.getUser_id(), courseId);
                if (createUserPractice == 0) {
                    throw new Exception();
                }
                for (UserPractice i : daoUP.getUserPracticeByUserIdAndCourseId(user.getUser_id(), courseId)) {
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
    }

    private void removeClass(HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        
        DAOUserEnrollCourse daoUERCRemove = new DAOUserEnrollCourse();
        
        User user = (User) request.getSession(true).getAttribute("member");
        
        try {
            int updateUserEnrollCourse = daoUERCRemove.updateUserEnrollCourse(user.getUser_id(), courseId, 0);
            if (updateUserEnrollCourse == 0) {
                throw new Exception();
            }
        } catch (Exception e) {
            response.getWriter().print("error");
        }
        response.sendRedirect("course-detail");
    }

}
