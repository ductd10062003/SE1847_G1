package model;

import entity.Course;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DAOCourse extends DBConnect {
    public Vector<Course> getAllCourses(){
        Vector<Course> vector = new Vector<>();
        String sql = "select * from [course]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vector.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
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
}
