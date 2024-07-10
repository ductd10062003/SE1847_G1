/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.UserHavePremium;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;


/**
 *
 * @author ductd
 */
public class DAOUserHavePremium extends DBConnect {

    public UserHavePremium getUserHavePremiumByUserId(int user_id) {
        String sql = "select * from User_Have_Premium where [user_id] = " + user_id;
        UserHavePremium u = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new UserHavePremium(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getFloat(6));
            }
        } catch (Exception e) {
        }
        return u;
    }

    public int createUserHavePremium(int user_id, int premium_id, String end_at, float price) {
        String sql = "insert into User_Have_Premium([user_id],premium_id, create_at, end_at, actual_price)\n"
                + "values (?,?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, premium_id);
            ps.setString(3, java.time.LocalDate.now().toString());
            ps.setString(4,end_at);
            ps.setFloat(5, price);
            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }

    public int updateUserHavePremium(int user_id, String end_at, float price) {
        int n = 0;
        String sql = "update User_Have_Premium\n"
                + "set create_at = ?, end_at = ?,actual_price = ? "
                + "where [user_id] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(4, user_id);
            ps.setString(1, java.time.LocalDate.now().toString());
            ps.setString(2,end_at);
            ps.setFloat(3, price);
            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }

    public static void main(String[] args) {
        LocalDate now = LocalDate.now();
        System.out.println(now);
    }
}
