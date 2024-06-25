/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.UserPractice;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOUserPractice extends DBConnect {

    public int createUserPractice(int user_id, int course_id, int times) {
        String sql = "insert into User_Practice([user_id],course_id,TOP_id,[times])"
                + "values("+user_id+","+course_id+",1,"+times+"),("+user_id+","+course_id+",2,"+times+"),("+user_id+","+course_id+",3,"+times+")";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }

    public int updateTimes(int user_id, int course_id, int top_id, int times) {
        String sql = "Update User_Practice\n"
                + "set times = "+times+" where [user_id]= "+user_id+" and course_id = "+course_id+" and TOP_id = "+top_id;
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }

    public Vector<UserPractice> getUserPracticeByUserIdAndCourseId(int user_id, int course_id) {
        String sql = "select * from User_Practice where user_id=? and course_id=?";
        Vector<UserPractice> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new UserPractice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
    
        public Vector<UserPractice> getUserPracticeByUserId(int user_id) {
        String sql = "select * from User_Practice where user_id=? ";
        Vector<UserPractice> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new UserPractice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public UserPractice getUserPracticeByUserIdAndCourseIdAndTOPId(int user_id, int course_id, int topId) {
        String sql = "select * from User_Practice where user_id=? and course_id=? and TOP_id = ?";
        UserPractice up = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            ps.setInt(3, topId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                up = new UserPractice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
        } catch (Exception e) {
            return null;
        }
        return up;
    }

    public UserPractice getUserPracticeByUserIdAndCourseIdAndTOPId2(int user_id, int course_id, int topId) {
        String sql = "select * from User_Practice where user_id=? and course_id=? and TOP_id = ?";
        UserPractice up = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            ps.setInt(3, topId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                up = new UserPractice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
            return null;
        }
        return up;
    }

    public static void main(String[] args) {
        System.out.println(new DAOUserPractice().createUserPractice(2, 1, 4));
    }
}
