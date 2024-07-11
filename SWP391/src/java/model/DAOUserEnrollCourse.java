package model;

import entity.UserEnrollCourse;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

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

    public Vector<UserEnrollCourse> getUserEnrollCourseInMonth(String date) {
        Vector<UserEnrollCourse> v = new Vector<>();
        String sql = "SELECT COUNT(*) as count\n"
                + "FROM [User_Enroll_Course]\n"
                + "WHERE create_at = ? and [status] = 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                v.add(new UserEnrollCourse(rs.getInt(1)));
            }
        } catch (Exception e) {
            return null;
        }
        return v;
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
        LocalDate now = LocalDate.now();
        System.out.println(now.toString());
        System.out.println(new DAOUserEnrollCourse().getUserEnrollCourseInMonth("2024-07-10").get(0).getStatus());
    }

}
