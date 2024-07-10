/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import com.google.gson.Gson;
import entity.Category;
import entity.Course;
import entity.FlashCard;
import entity.User;
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
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;

/**
 *
 * @author ductd
 */
@WebServlet(name = "addCourse", urlPatterns = {"/mentor/add-course"})
public class addCourse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");
//        if(user == null || user.getRole() != 2){
//            response.sendRedirect("../login");
//            return;
//        }

        DAOCategory daoCategory = new DAOCategory();

        request.setAttribute("categories", daoCategory.getAllCategories());
        request.getRequestDispatcher("../view-mentor/manager-course/add-course.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service != null) {
            switch (service) {
                case "random" ->
                    random(request, response);
                case "getFlashcardsByCourseID" ->
                    getFlashcardsByCourseID(request, response);
                case "create" ->
                    create(request, response);
            }
        }

    }

    private void random(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] flashcardsID = request.getParameterValues("flashcardsID[]");
        int random = Integer.parseInt(request.getParameter("random"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        DAOFlashCard dao = new DAOFlashCard();

        Gson gson = new Gson();

        if (flashcardsID == null) {
            Vector<FlashCard> vector = dao.getFlashCardByRandomNumber(random, categoryId, "");
            response.getWriter().print(gson.toJson(vector));
            return;
        }
        String notIn = "";
        for (int i = 0; i < flashcardsID.length; i++) {
            if (i == 0) {
                notIn += flashcardsID[0];
            } else {
                notIn = notIn + "," + flashcardsID[i];
            }
        }
        Vector<FlashCard> vector = dao.getFlashCardByRandomNumber(random, categoryId, "(" + notIn + ")");
        response.getWriter().print(gson.toJson(vector));
    }

    private void getFlashcardsByCourseID(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        response.getWriter().print(new Gson().toJson(new DAOFlashCard().getAllFlashCardsByCategoryId(categoryId)));
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        User user = (User) request.getSession(true).getAttribute("user");
        String courseName = request.getParameter("courseName");
        String des = request.getParameter("description");
        String[] flashcards = request.getParameterValues("flashcards[]");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        DAOCourse daoCourse = new DAOCourse();
        DAOQuiz daoQuiz = new DAOQuiz();

        if(daoCourse.getCourseByName(courseName) != null){
            response.getWriter().print("01");
            return;
        }
        
        Course course = new Course(courseName, des, java.time.LocalDate.now().toString(), java.time.LocalDate.now().toString(), 1, 22, categoryID);
        daoCourse.createCourse(course);
        int id = daoCourse.lastedCourseCreatedBy(22);
        Vector<Integer> vector = new Vector<>();

        for (String i : flashcards) {
            vector.add(Integer.parseInt(i));
        }

        daoQuiz.createQuiz(id, vector);

    }

}
