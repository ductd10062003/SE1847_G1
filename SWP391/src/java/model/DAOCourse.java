package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOCourse extends DBConnect {

    public Vector<Course> getAllCourses() {
        Vector<Course> vector = new Vector<>();
        String sql = "select * from [course]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public Course getCourseByID(int course_id) {
        Course course = new Course();
        String sql = "select * from [course] where course_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
            }
        } catch (Exception e) {
            return null;
        }
        return course;
    }

    //    nguyen dang truong
    //lay ra cac khoa hoc ma nguoi dung dang ki
    public Vector<Course> searchUserEnrollCourse(String user_id) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT c.course_id FROM User_Enroll_Course uec "
                + "JOIN Course c ON uec.course_id = c.course_id "
                + "WHERE uec.user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int course_id = rs.getInt("course_id");
                    Course course = getCourseByID(course_id);
                    if (course != null) {
                        courses.add(course);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }

    //tim cac khoa hoc theo ten da enroll
    public Vector<Course> searchEnrolledCoursesByName(String user_id, String courseName) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT c.* FROM User_Enroll_Course uec "
                + "JOIN Course c ON uec.course_id = c.course_id "
                + "WHERE uec.user_id = ? AND c.course_name LIKE ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, "%" + courseName + "%"); // Tìm kiếm một phần của tên khóa học
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int course_id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                String startDate = rs.getString(4);
                String endDate = rs.getString(5);
                int maxStudents = rs.getInt(6);
                int enrolledStudents = rs.getInt(7);
                int price = rs.getInt(8);

                Course course = new Course(course_id, name, description, startDate, endDate, maxStudents, enrolledStudents, price);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    //filter theo category
    public Vector<Course> getEnrolledCoursesByCategory(String userId, String categoryName) {
    Vector<Course> enrolledCourses = new Vector<>();
    String sql = "SELECT c.* " +
                 "FROM Course c " +
                 "INNER JOIN User_Enroll_Course uec ON c.course_id = uec.course_id " +
                 "INNER JOIN Category cat ON c.category_id = cat.category_id " +
                 "WHERE uec.user_id = ? AND cat.category_name = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userId);
        ps.setString(2, categoryName);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Course course = new Course(
                rs.getInt("course_id"),
                rs.getString("course_name"),
                rs.getString("description"),
                rs.getString("create_at"),
                rs.getString("update_at"),
                rs.getInt("active"),
                rs.getInt("created_by"),
                rs.getInt("category_id")
            );
            enrolledCourses.add(course);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return enrolledCourses;
}

    
    
    
    public static void main(String[] args) {

        DAOCourse dt = new DAOCourse();

        Vector<Course> vector = dt.getEnrolledCoursesByCategory("1", "cơ thể");
        for (Course title : vector) {
            System.out.println(title);
        }//end search

    }//end main

}
