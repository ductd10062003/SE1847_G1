/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.practice;

import com.google.gson.Gson;
import entity.FlashCard;
import entity.Quiz;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOResultDetail;
import model.DAOUserPractice;

/**
 *
 * @author ductd
 */
@WebServlet(name = "fillInBlank", urlPatterns = {"/fill-in-blank"})
public class fillInBlank extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int user_practice_id = Integer.parseInt(request.getParameter("user_practice_id"));
        if(user == null){
            response.sendRedirect("course-detail?course_id="+courseId);
            return;
        }
        request.setAttribute("course_id", courseId);
        request.setAttribute("user_practice_id", user_practice_id);
        request.getRequestDispatcher("practice/fill-in-blank.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service != null) {
            switch (service) {
                case "start" ->
                    start(request, response);
                case "result" ->
                    result(request, response);
            }
        }

    }

    private void start(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        DAOQuiz daoQuiz = new DAOQuiz();
        DAOFlashCard daoFlashCard = new DAOFlashCard();

        Gson gson = new Gson();

        Vector<Quiz> listQuiz = daoQuiz.getQuizsByCourseID(courseId);
        Vector<FlashCard> listFlashCard = daoFlashCard.getFlashCardInCourse(listQuiz);

        response.getWriter().print(gson.toJson(listFlashCard));
    }

    private void result(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int userPracticeId = Integer.parseInt(request.getParameter("user_practice"));
        int time = Integer.parseInt(request.getParameter("result_time"));
        float result = Float.parseFloat(request.getParameter("result_correct"));
        
        DAOUserPractice daoUserPractice = new DAOUserPractice();
        DAOResultDetail daoResultDetail = new DAOResultDetail();
        
        daoResultDetail.updateResultDetail(userPracticeId, result, time);
        
    }
}
