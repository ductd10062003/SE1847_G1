/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Category;
import entity.Course;
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
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;

/**
 *
 * @author ductd
 */
@WebServlet(name = "addCourse", urlPatterns = {"/mentor/add-course"})
public class addCourse extends HttpServlet {

    private Vector<Integer> listFlashCardId = new Vector<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOCategory daoCategory = new DAOCategory();

        request.setAttribute("categories", daoCategory.getAllCategories());
        request.getRequestDispatcher("../view-mentor/manager-course/add-course.jsp").forward(request, response);
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
                case "searchFlashCard":
                    searchFlashCard(request, response);
                    return;
                case "addFlashCardId":
                    addFlashCardId(request, response);
                    response.getWriter().print(listFlashCardId);
                    return;
                case "addFlashCard":
                    addFlashCard(request, response);
                    return;
                case "createCourse":
                    createCourse(request, response);
                    response.sendRedirect("add-course");
                    return;
                case "checkNameCourse":
                    checkNameCourse(request, response);
                    return;
            }
        }
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOCategory daoCategory = new DAOCategory();
        String searchValue = request.getParameter("category_name").trim();
        Vector<Category> vetor = daoCategory.getCategoriesByName(searchValue);
        if (vetor != null && vetor.isEmpty() == false) {
            for (Category c : vetor) {
                response.getWriter().print("<div class=\"form-check\">\n"
                        + "                                                        <input\n"
                        + "                                                            class=\"form-check-input\"\n"
                        + "                                                           onclick=\"categoryChecked(this)\"  type=\"radio\"\n"
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

    private void searchFlashCard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId");
        String question = request.getParameter("question");
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        Vector<FlashCard> vector = daoFlashCard.getFlashCardByQuestionsNameAndCategory(question, Integer.parseInt(categoryId));
        if (vector != null && vector.isEmpty() == false) {
            for (FlashCard fl : vector) {
                response.getWriter().print("<li><div class=\"card-body row\">\n"
                        + "                                                <div class=\"col-5\">\n"
                        + "                                                    <input                                                   \n"
                        + "                                                        type=\"text\"\n"
                        + "                                                        placeholder=\"Thuật ngữ\"\n"
                        + "                                                        class=\"w-100 fs-5 question\"\n"
                        + "                                                        value=\"" + fl.getQuestion() + "\"\n"
                        + "                                                        />\n"
                        + "                                                </div>\n"
                        + "                                                <div class=\"col-5\">\n"
                        + "                                                    <input\n"
                        + "                                                        type=\"text\"\n"
                        + "                                                        placeholder=\"Định nghĩa\"\n"
                        + "                                                        class=\"w-100 fs-5 answer\"  \n"
                        + "                                                        value=\"" + fl.getAnswer() + "\"\n"
                        + "                                                        />\n"
                        + "                                                </div>\n"
                        + "                                                <div class=\"col-2 text-end\">\n"
                        + "                                                    <button type=\"button\" class=\"btn btn-outline-secondary\" onclick=\"addFL('" + fl.getQuestion() + "','" + fl.getAnswer() + "'," + fl.getFlashcard_id() + ")\">Thêm</button>\n"
                        + "                                                </div>\n"
                        + "                                            </div></li>");
            }
        }
    }

    private void addFlashCardId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listId_raw = request.getParameter("listId");
        listFlashCardId.clear();
        String[] listId = listId_raw.split(",");
        for (String i : listId) {
            int id = Integer.parseInt(i);
            if (listFlashCardId.isEmpty() || listFlashCardId.contains(id) == false) {
                listFlashCardId.add(id);
            }
        }
    }

    private void addFlashCard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String random = request.getParameter("random");
        String categoryId = request.getParameter("categoryId");

        DAOFlashCard daoFlashCard = new DAOFlashCard();
        String[] notIn_raw = null;
        String notIn = "";
        if (!listFlashCardId.isEmpty()) {
            notIn_raw = listFlashCardId.toString().split("[\\[\\]]");
            notIn = "(" + notIn_raw[1].length() + ")";
        }
        Vector<FlashCard> vector = daoFlashCard.getFlashCardByRandomNumber(Integer.parseInt(random), Integer.parseInt(categoryId), notIn);
        String obj = "[";
        for (FlashCard fl : vector) {
            obj = obj + fl + "@@split@@";
        }
        obj += "]";
        response.getWriter().print(obj);
    }

    private void createCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mentor_id = 22;
        String category_id = request.getParameter("category_id");
        String course_name = request.getParameter("course_name");
        String description = request.getParameter("data_description");

        DAOQuiz daoQuiz = new DAOQuiz();
        DAOCourse daoCourse = new DAOCourse();

        LocalDate today = LocalDate.now();
        Course course = new Course(course_name, description, today.toString(), today.toString(), 1, mentor_id, Integer.parseInt(category_id));

        daoCourse.createCourse(course);

        int course_id = daoCourse.lastedCourseCreatedBy(mentor_id);

        daoQuiz.createQuiz(course_id, listFlashCardId);
    }

    private void checkNameCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        DAOCourse daoCourse = new DAOCourse();
        Course course = daoCourse.getCourseByName(name);
        if (course != null) {
            response.getWriter().print("Trùng tên khóa học");
        }

    }

}
