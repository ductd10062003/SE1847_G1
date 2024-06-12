/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import com.google.gson.Gson;
import entity.Category;
import entity.Course;
import entity.FlashCard;
import entity.Quiz;
import entity.TypeOfPractice;
import entity.User;
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
        // get course_id
        String courseId_raw = request.getParameter("course_id");
        int courseId = Integer.parseInt(courseId_raw);

        //DAO
        DAOCourse daoCourse = new DAOCourse();
        DAOCategory daoCategory = new DAOCategory();
        DAOTypeOfPractice daoT_O_P = new DAOTypeOfPractice();
        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();

        //Entity
        Course course = daoCourse.getCourseByID(courseId);
        Category category = daoCategory.getCategoryByID(course.getCategory_id());
        Vector<TypeOfPractice> listT_O_P = daoT_O_P.getAllTypeOfPractices();
        Vector<Quiz> listQuiz = daoQuiz.getQuizsByCourseID(courseId);
        Vector<FlashCard> listFlashCard = daoFlashCard.getFlashCardInCourse(listQuiz);
        DAOUserEnrollCourse daoUserEnrollCourse = new DAOUserEnrollCourse();
        //JSON
        Gson gson = new Gson();

        //test user
        HttpSession session = request.getSession(true);
        DAOUser daoUser = new DAOUser();
        session.setAttribute("user", daoUser.getUserByID(2));
        User user = (User) session.getAttribute("user");
        //set attribute
        request.setAttribute("course", course);
        request.setAttribute("category", category);
        request.setAttribute("typeOfPractices", listT_O_P);
        request.setAttribute("listFlashCards", gson.toJson(listFlashCard));
        request.setAttribute("quizzes", listFlashCard);
        request.setAttribute("enroll", daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), courseId));
        request.getRequestDispatcher("course-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        switch (service) {
            case "enroll" ->
                enroll(request, response);
            case "unenroll" ->
                unenroll(request);
        }
    }

    private void enroll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        //DAO
        DAOUserEnrollCourse daoUserEnrollCourse = new DAOUserEnrollCourse();
        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOResultDetail daoResultDetail = new DAOResultDetail();

        if (daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), courseId) == null) {
            daoUserEnrollCourse.createUserEnrollCourse(user.getUser_id(), courseId);
            daoUserPractice.createUserPractice(user.getUser_id(), courseId);

            for (UserPractice i : daoUserPractice.getUserPracticeByUserIdAndCourseId(user.getUser_id(), courseId)) {
                daoResultDetail.createResultDetail(i.getUserPractice_id());
            }
        } else {
            daoUserEnrollCourse.updateUserEnrollCourse(user.getUser_id(), courseId, 1);
        }

    }

    private void unenroll(HttpServletRequest request)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        DAOUserEnrollCourse daoUserEnrollCourse = new DAOUserEnrollCourse();

        daoUserEnrollCourse.updateUserEnrollCourse(user.getUser_id(), courseId, 0);

    }

    private void getProgressData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));
    }

}
