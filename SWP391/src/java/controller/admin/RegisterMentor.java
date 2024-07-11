package controller.admin;

import controller.authenciation.VerifyAccount;
import controller.authenciation.encrypt.GmailVerificationHandler;
import controller.authenciation.encrypt.PasswordEncryptor;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;

import java.io.IOException;

@WebServlet(name = "register-mentor", urlPatterns = {"/admin-mentor-manage/register-mentor"})
public class RegisterMentor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if(user == null || user.getRole() != 1){
            resp.sendRedirect("login");
            return;
        }

        req.getRequestDispatcher("register-mentor.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        //        get the username, email, password, confirm-password
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
//        get the date of birth, phone, gender
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        int gender = request.getParameter("gender").equals("male") ? 1 : 0;
//            if the username is already existed, set the error message and forward to register page

//                    if the username and email are not existed, create a new user and set the user to the session, then redirect to home page
        //User(int user_id, String name, String email, String password, int role, int active, String create_at, int gender, String dob, String phone, String image)
        User user = new User(0, username, email, password, 2, 1, java.time.LocalDate.now().toString(), gender, dob, phone, "");

        new DAOUser().createUser(user);

        resp.sendRedirect("manage-mentor");

    }
}
