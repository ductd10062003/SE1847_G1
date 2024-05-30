package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    //    nguyen dang truong
    //lay ra cac khoa hoc ma nguoi dung dang ki
    public Vector<Course> searchUserEnrollCourse(String user_id, int offset, int limit) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT c.course_id FROM User_Enroll_Course uec "
                + "JOIN Course c ON uec.course_id = c.course_id "
                + "WHERE uec.user_id = ? "
                + "ORDER BY c.course_id " // Thêm ORDER BY để sử dụng OFFSET FETCH
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setInt(2, offset);
            ps.setInt(3, limit);
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
    public Vector<Course> searchEnrolledCoursesByName(String user_id, String courseName, int currentPage, int pageSize) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT c.* FROM User_Enroll_Course uec "
                + "JOIN Course c ON uec.course_id = c.course_id "
                + "WHERE uec.user_id = ? AND c.course_name LIKE ? "
                + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, "%" + courseName + "%"); // Tìm kiếm một phần của tên khóa học
            int offset = Math.max((currentPage - 1) * pageSize, 0); // Đảm bảo offset không âm
            ps.setInt(3, offset);
            ps.setInt(4, pageSize);
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
    public Vector<Course> getEnrolledCoursesByCategory(String userId, String categoryName, int currentPage, int pageSize) {
    Vector<Course> enrolledCourses = new Vector<>();
    String sql = "SELECT c.* "
            + "FROM Course c "
            + "INNER JOIN User_Enroll_Course uec ON c.course_id = uec.course_id "
            + "INNER JOIN Category cat ON c.category_id = cat.category_id "
            + "WHERE uec.user_id = ? AND cat.category_name = ? "
            + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userId);
        ps.setString(2, categoryName);
        int offset = Math.max((currentPage - 1) * pageSize, 0); // Đảm bảo offset không âm
        ps.setInt(3, offset);
        ps.setInt(4, pageSize);
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
   public Vector<Course> getCompletedCourses(String user_id, int currentPage, int pageSize) {
    Vector<Course> courses = new Vector<>();
    String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
            + "FROM Result_Detail rd "
            + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
            + "JOIN Course c ON up.course_id = c.course_id "
            + "WHERE up.user_id = ? AND rd.result >= 3 "
            + "ORDER BY c.course_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user_id);
        int offset = Math.max((currentPage - 1) * pageSize, 0); // Đảm bảo offset không âm
        ps.setInt(2, offset);
        ps.setInt(3, pageSize);
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
    public Vector<Course> searchCompletedCoursesByName(String user_id, String courseName, int offset, int limit) {
    Vector<Course> courses = new Vector<>();
    String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Result_Detail rd "
                + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "JOIN Course c ON up.course_id = c.course_id "
                + "WHERE up.user_id = ? AND rd.result >= 3 AND c.course_name LIKE ? "
                + "ORDER BY c.course_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user_id);
        ps.setString(2, "%" + courseName + "%");
        ps.setInt(3, offset);
        ps.setInt(4, limit);
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
    public Vector<Course> getCompletedCoursesByCategory(String userId, String categoryName, int offset, int limit) {
    Vector<Course> completedCourses = new Vector<>();
    String sql = "SELECT DISTINCT c.* "
                + "FROM Result_Detail rd "
                + "INNER JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "INNER JOIN Course c ON up.course_id = c.course_id "
                + "INNER JOIN Category cat ON c.category_id = cat.category_id "
                + "WHERE up.user_id = ? AND cat.category_name = ? AND rd.result >= 3 "
                + "ORDER BY c.course_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, userId);
        ps.setString(2, categoryName);
        ps.setInt(3, offset);
        ps.setInt(4, limit);
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


    //in ra cac khoa hoc dang hoc(result<3)
   public Vector<Course> getStudyingCourses(String user_id, int offset, int limit) {
    Vector<Course> courses = new Vector<>();
    String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Result_Detail rd "
                + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "JOIN Course c ON up.course_id = c.course_id "
                + "WHERE up.user_id = ? AND rd.result < 3 "
                + "ORDER BY c.course_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user_id);
        ps.setInt(2, offset);
        ps.setInt(3, limit);
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


    //search cac khoa hoc dang hoc theo ten
    public Vector<Course> searchStudyingCoursesByName(String user_id, String courseName, int offset, int limit) {
    Vector<Course> courses = new Vector<>();
    String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Result_Detail rd "
                + "JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "JOIN Course c ON up.course_id = c.course_id "
                + "WHERE up.user_id = ? AND rd.result < 3 AND c.course_name LIKE ? "
                + "ORDER BY c.course_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user_id);
        ps.setString(2, "%" + courseName + "%");
        ps.setInt(3, offset);
        ps.setInt(4, limit);
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


    //filter cac khoa hoc dang hoctheo category
    public Vector<Course> getStudyingCoursesByCategory(String userId, String categoryName, int offset, int limit) {
    Vector<Course> courses = new Vector<>();
    String sql = "SELECT DISTINCT c.* "
                + "FROM Result_Detail rd "
                + "INNER JOIN User_Practice up ON rd.user_practice_id = up.user_practice_id "
                + "INNER JOIN Course c ON up.course_id = c.course_id "
                + "INNER JOIN Category cat ON c.category_id = cat.category_id "
                + "WHERE up.user_id = ? AND cat.category_name = ? AND rd.result < 3 "
                + "ORDER BY c.course_id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, userId);
        ps.setString(2, categoryName);
        ps.setInt(3, offset);
        ps.setInt(4, limit);
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
                courses.add(course);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return courses;
}

    
    
    //dem so khoa hoc ma student da enroll
    public int countUserEnrollCourses(String user_id) {
    String sql = "SELECT COUNT(c.course_id) FROM User_Enroll_Course uec "
            + "JOIN Course c ON uec.course_id = c.course_id "
            + "WHERE uec.user_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user_id);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return 0;
}
    
    public static void main(String[] args) {
//        LocalDate today = LocalDate.now();
//        Course course = new Course("test1", "no information", today.toString(), today.toString(), 1, 22, 1);
//        System.out.println(new DAOCourse().createCourse(course));
//        System.out.println(new DAOCourse().lastedCourseCreatedBy(22));
            
    }
    
}
