/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import entity.Course;
import entity.FlashCard;
import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Vector;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOFlashCard;
import model.DAOQuiz;
import model.DAOResultDetail;
import model.DAOTypeOfPractice;
import model.DAOUser;

/**
 *
 * @author DAT
 */
public class editCourse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editCourse at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String courseId_raw = request.getParameter("course_id");
        int courseId = Integer.parseInt(courseId_raw);

        DAOCourse daoCourse = new DAOCourse();
        DAOCategory daoCategory = new DAOCategory();
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        Course course = daoCourse.getCourseByCourseID(courseId);
        ArrayList<FlashCard> list = daoFlashCard.getQuizzByCouseID(courseId);
        request.setAttribute("course", course);
        request.setAttribute("list", list);
        request.getRequestDispatcher("../view-mentor/manager-course/edit-course.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy các tham số từ form
        String course_name = request.getParameter("course_name");
        String description = request.getParameter("description");
        int course_id = Integer.parseInt(request.getParameter("course_id"));

        // Kiểm tra trùng lặp theo course_name
        DAOCourse daoCourse = new DAOCourse();
        ArrayList<Course> courses = daoCourse.getAllCourses2();
        DAOFlashCard daoFlashCard = new DAOFlashCard();
        Vector<FlashCard> flashcards = daoFlashCard.getAllFlashCards();
        boolean isDuplicateCourse = false;
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDateTime = currentDateTime.format(formatter);
        for (Course course : courses) {
            if (course.getCourse_name().equals(course_name) && course.getDescription().equals(description)) {
                isDuplicateCourse = true;
                break;
            }
        }

        if (isDuplicateCourse) {
            // Nếu có trùng lặp, thiết lập attribute để hiển thị thông báo trên JSP
            request.setAttribute("duplicateError", "Tên khóa học đã tồn tại. Vui lòng chọn tên khóa học khác.");
        } else {
            // Nếu không có trùng lặp, tiến hành cập nhật khóa học
            int updateCourseResult = daoCourse.updateCourse(course_name, description,formattedDateTime, course_id);
            if (updateCourseResult > 0) {
                // Cập nhật khóa học thành công, thiết lập attribute thông báo thành công
                request.setAttribute("updateSuccess", "Cập nhật khóa học thành công.");
            } else {
                // Xử lý lỗi cập nhật khóa học (nếu cần)
                request.setAttribute("updateError", "Đã xảy ra lỗi khi cập nhật khóa học.");
            }
        }

        // Lấy thông tin các flashcard từ form
        boolean isDuplicateFlashCard = false;
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String img = request.getParameter("img");
        String flashcard_id = request.getParameter("flashcard_id");

        for (FlashCard list : flashcards) {
            if (list.getQuestion().equals(question) && list.getAnswer().equals(answer)) {
                isDuplicateFlashCard = true;
                break;
            }
            if (list.getQuestion().equals(question) && list.getAnswer() != answer) {
                isDuplicateFlashCard = true;
                break;
            }
            if (list.getQuestion() != question && list.getAnswer().equals(answer)) {
                isDuplicateFlashCard = true;
                break;
            }
        }
        if (isDuplicateFlashCard) {
            // Nếu có trùng lặp, thiết lập attribute để hiển thị thông báo trên JSP
            request.setAttribute("_duplicateError", "Câu hỏi đã tồn tại. Vui lòng điền khác.");
        } else {
            // Nếu không có trùng lặp, tiến hành cập nhật khóa học
            int updateFlashCard = daoFlashCard.updateFlashCard(question, answer, img, flashcard_id);
            if (updateFlashCard > 0) {
                // Cập nhật khóa học thành công, thiết lập attribute thông báo thành công
                request.setAttribute("_updateSuccess", "Cập nhật câu hỏi thành công.");
            } else {
                // Xử lý lỗi cập nhật khóa học (nếu cần)
                request.setAttribute("_updateError", "Đã xảy ra lỗi khi cập nhật câu hỏi.");
            }
        }
        // Đẩy dữ liệu và điều hướng về JSP để hiển thị thông báo
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
