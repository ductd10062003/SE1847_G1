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

    public int createUserPractice(int user_id, int course_id) {
        String sql = "insert into User_Practice(user_id,course_id,TOP_id)"
                + "values(?,?,1),(?,?,2),(?,?,3)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            ps.setInt(3, user_id);
            ps.setInt(4, course_id);
            ps.setInt(5, user_id);
            ps.setInt(6, course_id);
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
            while(rs.next()){
                vector.add(new UserPractice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
}
