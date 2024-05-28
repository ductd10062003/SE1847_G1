package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

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
    
    public int lastedCourseCreatedBy(int mentor_id){
        int id = 0;
        String sql = "SELECT Max(course_id) FROM [Course] where created_by = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, mentor_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            
        }
        return id;
    }
    
    public int createCourse(Course course){
        String sql = "insert into Course(course_name,[description],create_at,update_at,active,created_by, category_id)"
                + "values(?,?,?,?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, course.getCourse_name());
            ps.setString(2, course.getDescription());
            ps.setString(3, course.getCreated_at());
            ps.setString(4, course.getUpdate_at());
            ps.setInt(5, course.getActive());
            ps.setInt(6, course.getCreated_by());
            ps.setInt(7, course.getCategory_id());
            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }
    
    public Course getCourseByName(String course_name){
        String sql = "select * from course where course_name = ?";
        Course course = null;
        try {
            PreparedStatement ps =conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
    
    public static void main(String[] args) {
//        LocalDate today = LocalDate.now();
//        Course course = new Course("test1", "no information", today.toString(), today.toString(), 1, 22, 1);
//        System.out.println(new DAOCourse().createCourse(course));
//        System.out.println(new DAOCourse().lastedCourseCreatedBy(22));
            
    }
    
}
