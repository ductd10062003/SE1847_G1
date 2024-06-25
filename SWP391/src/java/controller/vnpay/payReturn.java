/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.vnpay;

import entity.Premium;
import entity.User;
import entity.UserHavePremium;
import entity.UserPractice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;
import java.util.HashMap;
import model.DAOPremium;
import model.DAOUserHavePremium;
import model.DAOUserPractice;

/**
 *
 * @author ductd
 */
@WebServlet(name = "payReturn", urlPatterns = {"/pay-return"})
public class payReturn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus")) && Config.transaction.getOrDefault(vnp_TxnRef, 1) == 0) {
                DAOUserPractice dAOUserPractice = new DAOUserPractice();
                DAOUserHavePremium daoUserHavePremium = new DAOUserHavePremium();
                DAOPremium daoPremium = new DAOPremium();
                
                String order_detail = request.getParameter("vnp_OrderInfo");
                String[] part = order_detail.split("@@");
                String premium_id = part[1];
                int user_id = Integer.parseInt(part[0]);
                
                Premium premium = daoPremium.getPremiumById(Integer.parseInt(premium_id));
                UserHavePremium uhp = daoUserHavePremium.getUserHavePremiumByUserId(user_id);
                
                if (uhp == null) {
                    LocalDate now = LocalDate.now();
                    LocalDate end_at = now.plusDays(premium.getDayActive());
                    float actual_price = premium.getPremium_price() * (1 - premium.getDiscount());
                    daoUserHavePremium.createUserHavePremium(user_id, Integer.parseInt(premium_id), end_at.toString(), actual_price);
                } else {
                    float actual_price = premium.getPremium_price() * (1 - premium.getDiscount());
                    
                    LocalDate create_at = LocalDate.parse(uhp.getCreate_at());
                    LocalDate end_at = LocalDate.parse(uhp.getEnd_at());
                    LocalDate now = LocalDate.now();
                    boolean sameMonthAndYear = create_at.getMonth() == now.getMonth() && create_at.getYear() == now.getYear();
                    if(sameMonthAndYear){
                        actual_price += uhp.getActual_price();
                    }           
                    if(now.isBefore(end_at)){
                        end_at = end_at.plusDays(premium.getDayActive());
                    }
                    else{
                        end_at = now.plusDays(premium.getDayActive());
                    }
                    daoUserHavePremium.updateUserHavePremium(user_id, end_at.toString(), actual_price);
                }
                
                for(UserPractice up : dAOUserPractice.getUserPracticeByUserId(user_id)){
                    dAOUserPractice.updateTimes(user_id, up.getCourse_id(), up.getTypeOfPractice_id(), -1);
                }
                
                request.setAttribute("result", 0);
                Config.transaction.put(vnp_TxnRef, 1);
            } else {
                request.setAttribute("result", 1);
            }
            
            
        } else {
            request.setAttribute("result", -1);
        }
        
        request.getRequestDispatcher("payment/pay-return.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
