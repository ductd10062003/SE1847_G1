package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
