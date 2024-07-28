/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Premium;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ductd
 */
public class DAOPremium extends DBConnect {

    public Vector<Premium> getAllPremium() {
        Vector<Premium> vector = new Vector<>();
        String sql = "Select * from Premium";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Premium(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getFloat(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return vector;
    }

    public int updatePremium(String name, double price, int day, int id) {
        int n = 0;
        String sql = "UPDATE [dbo].[Premium]\n"
                + "   SET [premium_name] = ?\n"
                + "      ,[premium_price] = ?\n"
                + "      ,[premium_discount] = 0\n"
                + "      ,[active] = 1\n"
                + "      ,[dayActive] = ?\n"
                + " WHERE [premium_id]=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, day);
            ps.setInt(4, id);
            n=ps.executeUpdate();

        } catch (Exception e) {
        }
        return n;
    }

    public Premium getPremiumById(int pre_id) {
        Premium pre = null;
        String sql = "Select * from Premium where premium_id = " + pre_id;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pre = new Premium(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getFloat(4), rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return pre;
    }

    public static void main(String[] args) {
        System.out.println(new DAOPremium().getPremiumById(1));
    }
}
