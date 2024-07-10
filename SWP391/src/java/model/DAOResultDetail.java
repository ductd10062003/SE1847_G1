/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Course;
import entity.ResultDetail;
import entity.User;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOResultDetail extends DBConnect {

    public ArrayList<ResultDetail> getResultByTOP_ID(int typeOfPractice_id) {
        ArrayList<ResultDetail> result = new ArrayList<>();
        String sql = "SELECT name,u.user_id, tp.TOP_name, SUM(rd.result) AS total_result, SUM(rd.time) AS total_time\n"
                + "from [User] u \n"
                + "INNER JOIN User_Practice up ON u.user_id = up.user_id\n"
                + "INNER JOIN Type_Of_Practice tp on up.TOP_id = tp.TOP_id\n"
                + "INNER JOIN Result_Detail rd on rd.user_practice_id = up.user_practice_id\n"
                + "where tp.TOP_id=?\n"
                + "GROUP BY u.name, u.user_id, tp.TOP_name\n"
                + "ORDER BY total_result DESC;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, typeOfPractice_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new ResultDetail(rs.getString(1), rs.getInt(2),rs.getString(3), rs.getFloat(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public ArrayList<ResultDetail> getTopRanking() {
        ArrayList<ResultDetail> result = new ArrayList<>();
        String sql = "SELECT u.name, u.user_id,SUM(rd.result) AS total_result,SUM(rd.time) AS total_time\n"
                + "FROM [User] u \n"
                + "INNER JOIN User_Practice up ON u.user_id = up.user_id\n"
                + "INNER JOIN Type_Of_Practice tp ON up.TOP_id = tp.TOP_id\n"
                + "INNER JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id\n"
                + "WHERE tp.TOP_id IN (1, 2, 3)\n"
                + "GROUP BY u.name, u.user_id\n"
                + "ORDER BY total_result DESC;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new ResultDetail(rs.getString(1), rs.getInt(2), rs.getFloat(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public int createResultDetail(int user_practice_id) {
        String sql = "insert into Result_Detail(result,user_practice_id,time)"
                + "values(0,?,0)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_practice_id);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }

    public int updateResultDetail(int user_practice_id, float result, int time) {
        String sql = "UPDATE Result_Detail\n"
                + "SET result = ?, time = ?\n"
                + "WHERE user_practice_id=?;";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setFloat(1, result);
            ps.setInt(2, time);
            ps.setInt(3, user_practice_id);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }

    public ResultDetail getResultDetail(int user_practice_id) {
        String sql = "select * from Result_Detail where user_practice_id = ?";
        ResultDetail rd = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, user_practice_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rd = new ResultDetail(rs.getFloat(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
        } catch (Exception e) {
            return null;
        }
        return rd;
    }

    public static void main(String[] args) {
        System.out.println(new DAOResultDetail().updateResultDetail(25, 1, 1));
    }
}
