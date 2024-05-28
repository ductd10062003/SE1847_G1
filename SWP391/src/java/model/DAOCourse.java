package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOCourse extends DBConnect {
    public ArrayList<Course> getAllCourses(){
        ArrayList<Course> list = new ArrayList<>();
        String sql = "select * from [course]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            return null;
        }
        return list;
    }
    
    public Course getCourseByID(int course_id){
        Course course = new Course();
        String sql = "select * from [course] where course_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
            }
        } catch (Exception e) {
            return null;
        }
        return course;
    }
    public Course getCourseByName(String course_name){
        Course course = new Course();
        String sql = "select * from [course] where course_name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, course_name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
            }
        } catch (Exception e) {
            return null;
        }
        return course;
    }
    public Vector<Course> getCoursesOutstanding() {
        Vector<Course> vector = new Vector<>();
        String sql = "SELECT TOP 5 \n"
                + "    c.course_id,\n"
                + "    c.course_name,\n"
                + "    c.description,\n"
                + "	c.image,\n"
                + "	ca.category_name,\n"
                + "    COUNT(uec.user_id) AS enrollment_count\n"
                + "FROM \n"
                + "    User_Enroll_Course uec\n"
                + "JOIN \n"
                + "    Course c ON uec.course_id = c.course_id\n"
                + "JOIN \n"
                + "    Category ca ON c.category_id = ca.category_id\n"
                + "GROUP BY \n"
                + "    c.course_id,\n"
                + "    c.course_name,\n"
                + "    c.description,\n"
                + "	ca.category_name,\n"
                + "	c.image\n"
                + "ORDER BY \n"
                + "    enrollment_count DESC;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vector.add(new Course(
                        rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
}
