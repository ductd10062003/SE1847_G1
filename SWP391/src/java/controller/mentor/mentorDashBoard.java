package controller.mentor;

import com.google.gson.Gson;
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
import model.DAOUserEnrollCourse;

/**
 *
 * @author ductd
 */
@WebServlet(name = "mentorDashBoard", urlPatterns = {"/mentor/dashboard"})
public class mentorDashBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        LocalDate now = LocalDate.now();
        Gson gson = new Gson();

        request.setAttribute("dataForDays", gson.toJson(new DAOUserEnrollCourse().getUserEnrollCourseInMonth(now.toString(), user.getUser_id())));
        request.getRequestDispatcher("../view-mentor/mentor-dashboard.jsp").forward(request, response);
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
        User user = (User) request.getSession(true).getAttribute("user");
        String[] days = request.getParameterValues("days[]");
        Vector<Integer> data = new Vector<>();
        for (int i = 0; i < days.length; i++) {
            int a = new DAOUserEnrollCourse().getUserEnrollCourseInMonth(days[i], user.getUser_id()).get(0).getStatus();
            data.add(a);
        }
        response.getWriter().print(new Gson().toJson(data));
    }

}
