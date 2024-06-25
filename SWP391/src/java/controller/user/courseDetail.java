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
import entity.ResultDetail;
import entity.TypeOfPractice;
import entity.User;
import entity.UserEnrollCourse;
import entity.UserHavePremium;
import entity.UserPractice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOResultDetail;
import model.DAOTypeOfPractice;
import model.DAOUser;
import model.DAOUserEnrollCourse;
import model.DAOUserHavePremium;
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
        //DAOUser daoUser = new DAOUser();
        //session.setAttribute("user", daoUser.getUserByID(2));
        User user = (User) session.getAttribute("user");
        //set attribute
        if (user != null) {
            UserEnrollCourse uec = daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), courseId);
            if (uec != null) {
                request.setAttribute("enroll", uec.getStatus());
            }
        }
        request.setAttribute("course", course);
        request.setAttribute("category", category);
        request.setAttribute("typeOfPractices", listT_O_P);
        request.setAttribute("listFlashCards", gson.toJson(listFlashCard));
        request.setAttribute("quizzes", listFlashCard);
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
            case "progress" ->
                getProgressData(request, response);
            case "practice" ->
                practice(request, response);
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
        DAOUserHavePremium daoUserHavePremium = new DAOUserHavePremium();

        if (daoUserEnrollCourse.getUserEnrollCourse(user.getUser_id(), courseId) == null) {
            daoUserEnrollCourse.createUserEnrollCourse(user.getUser_id(), courseId);
            int times = 3;
            if (daoUserHavePremium.getUserHavePremiumByUserId(user.getUser_id()) != null) {
                UserHavePremium uhp = daoUserHavePremium.getUserHavePremiumByUserId(user.getUser_id());
                LocalDate now = LocalDate.now();
                LocalDate end_at = LocalDate.parse(uhp.getEnd_at());
                if (now.isBefore(end_at)) {
                    times = -1;
                } else {
                    times = 0;
                }

            }
            daoUserPractice.createUserPractice(user.getUser_id(), courseId, times);

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

        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOResultDetail dAOResultDetail = new DAOResultDetail();
        DAOTypeOfPractice daoTypeOfPractice = new DAOTypeOfPractice();

        Vector<ResultDetail> v = new Vector<>();
        for (TypeOfPractice top : daoTypeOfPractice.getAllTypeOfPractices()) {
            UserPractice up = daoUserPractice.getUserPracticeByUserIdAndCourseIdAndTOPId(user.getUser_id(), courseId, top.getTypeOfPractice_id());
            ResultDetail rd = dAOResultDetail.getResultDetail(up.getUserPractice_id());
            v.add(rd);
        }
        Gson gson = new Gson();

        response.getWriter().print(gson.toJson(v));
    }

    private void practice(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int TOP_id = Integer.parseInt(request.getParameter("TOP_id"));

        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOUserHavePremium daoUserHavePremium = new DAOUserHavePremium();

        UserHavePremium uhp = daoUserHavePremium.getUserHavePremiumByUserId(user.getUser_id());
        if (uhp != null) {
            LocalDate now = LocalDate.now();
            LocalDate end_at = LocalDate.parse(uhp.getEnd_at());
            if (now.isAfter(end_at)) {
                daoUserPractice.updateTimes(user.getUser_id(), courseId, TOP_id, 0);
            }
        }

        UserPractice up = daoUserPractice.getUserPracticeByUserIdAndCourseIdAndTOPId2(user.getUser_id(), courseId, TOP_id);
        int times = up.getTimes();

        if (times != 0) {
            int up_id = up.getUserPractice_id();
            int times_after = (times == -1) ? times : (times - 1);
            daoUserPractice.updateTimes(user.getUser_id(), courseId, TOP_id, times_after);
            switch (TOP_id) {
                case 1 ->
                    response.getWriter().print("multiple-choice?course_id=" + courseId + "&user_practice_id=" + up_id);
                case 2 ->
                    response.getWriter().print("fill-in-blank?course_id=" + courseId + "&user_practice_id=" + up_id);
                case 3 ->
                    response.getWriter().print("matching?course_id=" + courseId + "&user_practice_id=" + up_id);
            }
        } else {
            response.getWriter().print("err");
        }

    }
}
