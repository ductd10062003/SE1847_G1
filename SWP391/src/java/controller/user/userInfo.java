/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.IConstant;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import model.DAOUser;
import util.Validate;

/**
 *
 * @author HP
 */
@MultipartConfig
@WebServlet(name = "userInfo", urlPatterns = {"/userInfo"})
public class userInfo extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet userInfo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userInfo at " + request.getContextPath() + "</h1>");
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
        DAOUser daoUser = new DAOUser();
        HttpSession session = request.getSession();
        //test user 1
        User user = daoUser.getUserByID(1);
        //profile info update user info and update password
        String service = request.getParameter("Service");
        if(service == null) {
         service = IConstant.USER_INFO[0];
        }
        request.setAttribute("service", service);
        //test first user
        session.setAttribute("currentUser", user);
        request.getRequestDispatcher("profileInfo.jsp").forward(request, response);
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
        DAOUser daoUser = new DAOUser();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("currentUser");
        String service = request.getParameter("Service");
        boolean isSuccess = false;
        String mess = "";
        //update info
        if (service.equals(IConstant.USER_INFO[0])) {
            String filename = null;
            String name = request.getParameter("name");
            Part userImage = request.getPart("accountImage");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            if (userImage.equals("") || userImage == null) {
                userImage = request.getPart("beforeImage");
            }
            
            System.out.println("here");

            if (filename == null) {
                filename = user.getImage();
            } else {
                //lưu ảnh vào địa chỉ folder images
                filename = userImage.getSubmittedFileName();
                String folderPath = getServletContext().getRealPath("") + File.separator + "images";
                saveImage(userImage, folderPath, filename);
            }
            if (!Validate.isValidName(name)) {
                mess = "The name must be alphabet";
                 request.setAttribute("isSuccess", isSuccess);
            request.setAttribute("mess", mess);
            request.setAttribute("service", IConstant.USER_INFO[0]);
            request.getRequestDispatcher("profileInfo.jsp").forward(request, response);
                return;
            }
            if (!Validate.isValidPhoneNumber(phone)) {
                mess = "The phone invalid";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
            }
            if(Period.between(LocalDate.parse(dob), LocalDate.now()).getYears() < 3) {
                mess = "The date of birth invalid";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
            }
            User userChange = new User(user.getUser_id(), name,
                    Integer.parseInt(gender), phone, filename, Date.valueOf(dob));

            boolean isUpdate = daoUser.updateUser(userChange);

            if (isUpdate) {
                User updatedUser = daoUser.getUserByID(user.getUser_id());
                session.removeAttribute("currentUser"); // Xóa đối tượng cũ khỏi phiên
                session.setAttribute("currentUser", updatedUser); // Thêm đối tượng mới vào phiên
                isSuccess = true;
                mess = "update success";

            } else {
                isSuccess = false;
                mess = "update false";
            }
            System.out.println(isUpdate);
            request.setAttribute("isSuccess", isSuccess);
            request.setAttribute("mess", mess);
            request.setAttribute("service", IConstant.USER_INFO[0]);
            request.getRequestDispatcher("profileInfo.jsp").forward(request, response);
        }
        //chaneg password
        if(service.equals(IConstant.USER_INFO[1])) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            
             if (currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
                mess = "Please fill in all fields.";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
              }
             //check valid current password
//             System.out.println("curr"+user.getEmail()+" /"+Validate.getMd5(currentPassword));
              if (daoUser.ValidateCustomer(user.getEmail(), Validate.getMd5(currentPassword)) == null) {
                mess = "The current password incorrect.";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
              }
              
              //check valid format password
              if (!Validate.isValidPassword(newPassword)) {
                mess = "Password must have at least "+IConstant.PASSWORD_LENGTH+" characters and combine uppercase letters, lowercase letters, numbers and special characters.";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
              }
              //check valid confirm password
              if (!newPassword.equals(confirmPassword)) {
                mess = "The confirm password incorrect.";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
              }
               if (newPassword.equals(currentPassword)) {
                mess = "The new password you just entered is the same as the old password.";
                setCommonAttributes(request, response, mess, isSuccess, service);
                return;
              }
               daoUser.updatePassword(Validate.getMd5(newPassword), user.getUser_id());
               mess = "change password success";
               setCommonAttributes(request, response, mess, !isSuccess, service);
        }
    }
    private void setCommonAttributes(HttpServletRequest request, 
            HttpServletResponse response, String mess, 
            boolean isSuccess, String current)  throws ServletException, IOException  {
         request.setAttribute("isSuccess", isSuccess);
         request.setAttribute("service", current);
         request.setAttribute("mess", mess);
         request.getRequestDispatcher("profileInfo.jsp").forward(request, response);
         return;
    }

    private void saveImage(Part part, String folderPath, String filename) throws IOException {
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String filePath = folderPath + File.separator + filename;
        try ( InputStream inputStream = part.getInputStream()) {
            Path path = Paths.get(filePath);
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
        }
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

    public static void main(String[] args) {
        DAOUser daoUser = new DAOUser();
        //123456
//        for (User us : daoUser.getAllUsers()) {
//            daoUser.updatePassword(Validate.getMd5(us.getPassword()), us.getUser_id());
//        }
        System.out.println(daoUser.ValidateCustomer("user1@gmail.com",Validate.getMd5("123456")));
    }

}
