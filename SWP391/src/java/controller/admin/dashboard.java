/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import com.google.gson.Gson;
import entity.User;
import entity.UserHavePremium;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Vector;
import model.DAOUser;
import model.DAOUserEnrollCourse;
import model.DAOUserHavePremium;

/**
 *
 * @author ductd
 */
@WebServlet(name = "dashboard", urlPatterns = {"/admin/dashboard"})
public class dashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDate now = LocalDate.now();
        Gson gson = new Gson();
        DAOUser daoUser = new DAOUser();
        DAOUserHavePremium daoUHP = new DAOUserHavePremium();
        User user = (User) request.getSession(true).getAttribute("user");
        
        int havePre = daoUHP.getAllStudentsHavePre();
        int allStudent = daoUser.getAllStudents();
        request.setAttribute("noPre", allStudent - havePre);
        request.setAttribute("havePre", havePre);
        request.setAttribute("dataForDays", gson.toJson(new DAOUserEnrollCourse().getUserEnrollCourseInMonth(now.toString(), user.getUser_id())));
        request.getRequestDispatcher("../admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service != null) {
            switch (service) {
                case "getDayForData" ->
                    getDayForData(request, response);
            }
        }
    }

    private void getDayForData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] days = request.getParameterValues("days[]");
        Vector<Float> data = new Vector<>();
        for (int i = 0; i < days.length; i++) {
            UserHavePremium a = new DAOUserHavePremium().getSumPriceInday(days[i]);
            if (a == null) {
                data.add(0f);
            } else {
                data.add(a.getActual_price());
            }

        }
        response.getWriter().print(new Gson().toJson(data));
    }
    

}
