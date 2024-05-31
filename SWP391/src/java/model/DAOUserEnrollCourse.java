package model;

import entity.UserEnrollCourse;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOUserEnrollCourse extends DBConnect {

    public int createUserEnrollCourse(int user_id, int course_id) {
        String sql = "insert into User_Enroll_Course(user_id,course_id,status)"
                + "values(?,?,1)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return n;
        }
        return n;
    }

    public UserEnrollCourse getUserEnrollCourse(int user_id, int course_id) {
        String sql = "select * from User_Enroll_Course where user_id=? and course_id=?";
        UserEnrollCourse urc = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                urc = new UserEnrollCourse(rs.getInt(1), rs.getInt(2), rs.getInt(3));
            }
        } catch (Exception e) {
            return null;
        }
        return urc;
    }
    
    public int updateUserEnrollCourse(int user_id, int course_id, int status) {
        String sql = "update User_Enroll_Course set status=? where user_id=? and course_id=?";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, user_id);
            ps.setInt(3, course_id);
            n = ps.executeUpdate();
        } catch (Exception e) {
            return 0;
        }
        return n;
    }
    
    public static void main(String[] args) {
        System.out.println(new DAOUserEnrollCourse().updateUserEnrollCourse(1, 5, 0));
    }

}
