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

        DAOQuiz daoQuiz = new DAOQuiz();

        String action = request.getParameter("action");
        System.out.println(action);
        if (action != null) {
            boolean isDuplicateFlashCard = false;

            String course_id = request.getParameter("course_id");
            String flashcard_id = request.getParameter("flashcard_id");
            String category_id = request.getParameter("category_id");
            System.out.println(flashcard_id);

            int course_id2 = Integer.parseInt(course_id);
            System.out.println(course_id2);
            int flashcard_id2 = Integer.parseInt(flashcard_id);
            System.out.println(flashcard_id2);
            int category_id2 = Integer.parseInt(category_id);
            System.out.println(category_id2);
            switch (action) {
                case "add":
                    boolean addSuccess = daoQuiz.addRandomQuizInCourse(course_id2, category_id2);

                    // Kiểm tra kết quả
                    if (addSuccess) {
                        // Thành công
                        request.setAttribute("notification1", "Thêm câu hỏi thành công.");
                    } else {
                        // Thất bại
                        request.setAttribute("notification1", "Thêm câu hỏi không thành công.");
                    }
                    break;
                case "delete":
                    boolean deleteSuccess = daoQuiz.deleteQuizByFlashcardId(course_id2, flashcard_id2);

                    // Kiểm tra kết quả
                    if (deleteSuccess) {
                        // Thành công
                        request.setAttribute("notification2", "Xóa câu hỏi thành công.");
                    } else {
                        // Thất bại
                        request.setAttribute("notification2", "Xóa câu hỏi không thành công.");
                    }
                    break;
                default:
                    System.out.println("Error");
            }

            // Đẩy dữ liệu và điều hướng về JSP để hiển thị thông báo
            doGet(request, response);
            return;
        }

        // Lấy các tham số từ form
        String course_name = request.getParameter("course_name");
        String description = request.getParameter("description");
        int course_id = Integer.parseInt(request.getParameter("course_id"));

        System.out.println("coursename " + course_name);
        System.out.println("description " + description);
        System.out.println("course_id " + course_id);

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
            int updateCourseResult = daoCourse.updateCourse(course_name, description, formattedDateTime, course_id);
            if (updateCourseResult > 0) {
                // Cập nhật khóa học thành công, thiết lập attribute thông báo thành công
                request.setAttribute("updateSuccess", "Cập nhật khóa học thành công.");
            } else {
                // Xử lý lỗi cập nhật khóa học (nếu cần)
                request.setAttribute("updateError", "Đã xảy ra lỗi khi cập nhật khóa học.");
            }
        }
        doGet(request, response);
        // Lấy thông tin các flashcard từ form
    }
}
