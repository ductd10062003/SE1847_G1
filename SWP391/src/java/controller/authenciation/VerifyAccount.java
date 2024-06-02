
package controller.authenciation;

import controller.authenciation.encrypt.PasswordEncryptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOUser;
import entity.User;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author ductd
 */
@WebServlet(name = "verify-account", urlPatterns = {"/verify-account"})
public class VerifyAccount extends HttpServlet {

    private static ConcurrentHashMap<String, User> pendingUsers = new ConcurrentHashMap<>();

    public static void addPendingUser(User user, String code) {

        pendingUsers.put(code, user);
        expirePendingUserThread(code);
    }

    private static void expirePendingUserThread(String code){
        new Thread(() -> {
            try {
                Thread.sleep(30000);
                pendingUsers.remove(code);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check if the user logged on already
        if(request.getSession().getAttribute("user") != null){
            //logout
            request.getSession().removeAttribute("user");
        }else{
            if(request.getSession().getAttribute("verifying") == null)
                request.getRequestDispatcher("login.jsp").forward(request, response);
            else{
                request.getSession().removeAttribute("verifying");
                request.getRequestDispatcher("ConfirmVerificationCode.jsp").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String verificationCode = request.getParameter("verification-code");
        User user = pendingUsers.get(request.getSession().getId());
        String OTP = (String)request.getSession().getAttribute("OTP");

        if(user == null){
            request.getSession().setAttribute("error", "Session expired. Please try again.");
            request.getRequestDispatcher("ConfirmVerificationCode.jsp").forward(request, response);
        } else {
            if(!PasswordEncryptor.validatePassword(verificationCode, OTP)){
                request.getSession().setAttribute("error", "Invalid verification code");
                request.getRequestDispatcher("ConfirmVerificationCode.jsp").forward(request, response);
                return;
            }

            new DAOUser().createUser(user);
            request.getSession().setAttribute("success", "Account created successfully");

            pendingUsers.remove(request.getSession().getId());
            request.getSession().removeAttribute("OTP");
            request.getRequestDispatcher("ConfirmVerificationCode.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
