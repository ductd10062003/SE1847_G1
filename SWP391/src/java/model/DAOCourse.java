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

    //filter cac khoa hoc da enroll theo category
    public Vector<Course> getEnrolledCoursesByCategory(String userId, String categoryName) {
        Vector<Course> enrolledCourses = new Vector<>();
        String sql = "SELECT c.* "
                + "FROM Course c "
                + "INNER JOIN User_Enroll_Course uec ON c.course_id = uec.course_id "
                + "INNER JOIN Category cat ON c.category_id = cat.category_id "
                + "WHERE uec.user_id = ? AND cat.category_name = ?";
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

    //in ra cac khoa hoc da hoan thanh(result>3)
    public Vector<Course> getCompletedCourses(String user_id) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Result_Detail rd "
                + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "JOIN Course c ON up.course_id = c.course_id "
                + "WHERE up.user_id = ? AND rd.result >= 3";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setCourse_id(rs.getInt("course_id"));
                    course.setCourse_name(rs.getString("course_name"));
                    course.setDescription(rs.getString("description"));
                    course.setCreated_at(rs.getString("create_at"));
                    course.setUpdate_at(rs.getString("update_at"));
                    course.setActive(rs.getInt("active"));
                    course.setCreated_by(rs.getInt("created_by"));
                    course.setCategory_id(rs.getInt("category_id"));
                    courses.add(course);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }

    //search cac khoa hoc da hoan thanh theo ten
    public Vector<Course> searchCompletedCoursesByName(String user_id, String courseName) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Result_Detail rd "
                + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "JOIN Course c ON up.course_id = c.course_id "
                + "WHERE up.user_id = ? AND rd.result >= 3 AND c.course_name LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setString(2, "%" + courseName + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int course_id = rs.getInt("course_id");
                    String name = rs.getString("course_name");
                    String description = rs.getString("description");
                    String createdAt = rs.getString("create_at");
                    String updatedAt = rs.getString("update_at");
                    int active = rs.getInt("active");
                    int createdBy = rs.getInt("created_by");
                    int categoryId = rs.getInt("category_id");

                    Course course = new Course(course_id, name, description, createdAt, updatedAt, active, createdBy, categoryId);
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    
    //filter cac khoa hoc da hoan thanh theo category
    public Vector<Course> getCompletedCoursesByCategory(String userId, String categoryName) {
        Vector<Course> completedCourses = new Vector<>();
        String sql = "SELECT DISTINCT c.* " +
                     "FROM Result_Detail rd " +
                     "INNER JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id " +
                     "INNER JOIN Course c ON up.course_id = c.course_id " +
                     "INNER JOIN Category cat ON c.category_id = cat.category_id " +
                     "WHERE up.user_id = ? AND cat.category_name = ? AND rd.result >=3";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, categoryName);
            try (ResultSet rs = ps.executeQuery()) {
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
                    completedCourses.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return completedCourses;
    }
    
    
    public static void main(String[] args) {

        DAOCourse dt = new DAOCourse();

        Vector<Course> vector = dt.getCompletedCoursesByCategory("1", "cơ thể");
        for (Course title : vector) {
            System.out.println(title);
        }//end search

    }//end main

}
