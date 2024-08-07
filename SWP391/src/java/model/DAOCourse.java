package model;

import entity.Course;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class DAOCourse extends DBConnect {

    public int updateCourse(String course_name, String description,String update_at,int course_id) {
        String sql = "  UPDATE [Course]\n"
                + "  Set course_name = ?, description = ?, update_at = ?\n"
                + "  where course_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, course_name);
            ps.setString(2, description);
            ps.setString(3, update_at);          
            ps.setInt(4, course_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public ArrayList<Course> getCouseByUserId(int user_id) {
        ArrayList<Course> course = new ArrayList<>();
        String sql = "  select c.course_id,c.course_name,ca.category_name,ca.category_id,c.description,c.create_at,c.update_at,c.active\n"
                + "  from Course c inner join [User] u \n"
                + "  on c.created_by = u.user_id \n"
                + "  inner join Category ca on c.category_id = ca.category_id\n"
                + "  where u.user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

    public ArrayList<Course> getListByCourse(ArrayList<Course> list, int start, int end) {
        ArrayList<Course> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<Course> getTop6NewestCourse() {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "SELECT TOP 6 *\n"
                + "FROM course\n"
                + "ORDER BY create_at DESC, NEWID();";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            return null;
        }
        return list;
    }

    public ArrayList<Course> getAllCourses2() {
        ArrayList<Course> list = new ArrayList<>();
        String sql = "select * from [course]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            return null;
        }
        return list;
    }

    public ArrayList<Course> getCouseByCategoryIDandName(String category_id, String course_name) {
        ArrayList<Course> course = new ArrayList<>();
        String sql = "select course_name,course_id,description \n"
                + "from Category ca INNER Join Course c \n"
                + "on ca.category_id = c.category_id\n"
                + "where c.category_id = ? and c.course_name like ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, category_id);
            ps.setString(2, "%" + course_name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new Course(rs.getString(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

    public ArrayList<Course> getCourseByUserName(String name) {
        ArrayList<Course> course = new ArrayList<>();
        String sql = "  select u.name,u.user_id,u.role,u.gender,u.dob,u.phone,u.email,c.course_name,c.course_id,c.description\n"
                + "  from Course c inner join [User] u\n"
                + "  on c.created_by = u.user_id\n"
                + "  where u.name like ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new Course(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

    public ArrayList<Course> getCourseByName2(String course_name) {
        ArrayList<Course> course = new ArrayList<>();
        String sql = "select course_name,course_id,description from [course] where course_name like ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, "%" + course_name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new Course(rs.getString(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

    public ArrayList<Course> getCouseByCategoryID(String category_id) {
        ArrayList<Course> course = new ArrayList<>();
        String sql = "  select course_name,course_id,description from Category ca INNER Join Course c on ca.category_id = c.category_id\n"
                + "  where c.category_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, category_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new Course(rs.getString(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

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

    public Course getCourseByCourseID(int course_id) {
        Course course = new Course();
        String sql = "select c.course_name,c.course_id,c.description,c.create_at,c.update_at,c2.category_id,c2.category_name\n"
                + "  from [course] c inner join Category c2 \n"
                + "  on c.category_id = c2.category_id \n"
                + "  where course_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course = new Course(rs.getString(1),rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
            }
        } catch (Exception e) {
            return null;
        }
        return course;
    }

    public int lastedCourseCreatedBy(int mentor_id) {
        int id = 0;
        String sql = "SELECT Max(course_id) FROM [Course] where created_by = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, mentor_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return id;
    }

    public int createCourse(Course course) {
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

    public Course getCourseByName(String course_name) {
        String sql = "select * from course where course_name = ?";
        Course course = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, course_name);
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
                + "WHERE uec.user_id = ? AND status=1";
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
                + "WHERE uec.user_id = ? AND c.course_name LIKE ? AND status=1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, "%" + courseName + "%");
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
    public Vector<Course> getEnrolledCoursesByCategories(String userId, String[] categoryNames) {
        Vector<Course> enrolledCourses = new Vector<>();
        StringBuilder sql = new StringBuilder("SELECT c.* ")
                .append("FROM Course c ")
                .append("INNER JOIN User_Enroll_Course uec ON c.course_id = uec.course_id ")
                .append("INNER JOIN Category cat ON c.category_id = cat.category_id ")
                .append("WHERE uec.user_id = ? AND status=1");

        if (categoryNames != null && categoryNames.length > 0) {
            sql.append("AND cat.category_name IN (");
            for (int i = 0; i < categoryNames.length; i++) {
                sql.append("?");
                if (i < categoryNames.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }

        try {
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            ps.setString(1, userId);
            if (categoryNames != null && categoryNames.length > 0) {
                for (int i = 0; i < categoryNames.length; i++) {
                    ps.setString(2 + i, categoryNames[i]);
                }
            }
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
                + "FROM Course c "
                + "JOIN ("
                + "    SELECT uec.course_id "
                + "    FROM User_Enroll_Course uec "
                + "    WHERE uec.user_id = ? AND uec.status = 1"
                + ") enrolled_courses ON c.course_id = enrolled_courses.course_id "
                + "JOIN User_Practice up ON up.course_id = c.course_id AND up.user_id = ? "
                + "JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id "
                + "WHERE rd.result > 3 "
                + "GROUP BY c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "HAVING COUNT(DISTINCT up.TOP_id) = 3";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setString(2, user_id);
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
                + "FROM Course c "
                + "JOIN ("
                + "    SELECT uec.course_id "
                + "    FROM User_Enroll_Course uec "
                + "    WHERE uec.user_id = ? AND uec.status = 1"
                + ") enrolled_courses ON c.course_id = enrolled_courses.course_id "
                + "JOIN User_Practice up ON up.course_id = c.course_id AND up.user_id = ? "
                + "JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id "
                + "WHERE rd.result > 3 "
                + "GROUP BY c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "HAVING COUNT(DISTINCT up.TOP_id) = 3"
                + "AND c.course_name LIKE ? ";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setString(2, user_id);
            ps.setString(3, "%" + courseName + "%");
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
    public Vector<Course> filterCompletedCoursesByCategories(String userId, String[] categoryNames) {
        Vector<Course> courses = new Vector<>();
        StringBuilder sql = new StringBuilder("SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
                .append("FROM Course c ")
                .append("JOIN (")
                .append("    SELECT uec.course_id ")
                .append("    FROM User_Enroll_Course uec ")
                .append("    WHERE uec.user_id = ? AND uec.status = 1")
                .append(") enrolled_courses ON c.course_id = enrolled_courses.course_id ")
                .append("JOIN User_Practice up ON up.course_id = c.course_id AND up.user_id = ? ")
                .append("JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id ")
                .append("JOIN Category cat ON c.category_id = cat.category_id ")
                .append("WHERE rd.result > 3 ");

        if (categoryNames != null && categoryNames.length > 0) {
            sql.append("AND cat.category_name IN (");
            for (int i = 0; i < categoryNames.length; i++) {
                sql.append("?");
                if (i < categoryNames.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }

        sql.append("GROUP BY c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
                .append("HAVING COUNT(DISTINCT up.TOP_id) = 3");

        try {
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            ps.setString(1, userId);
            ps.setString(2, userId);
            if (categoryNames != null && categoryNames.length > 0) {
                for (int i = 0; i < categoryNames.length; i++) {
                    ps.setString(3 + i, categoryNames[i]);
                }
            }
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
                courses.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }

    //in ra cac khoa hoc dang hoc(result<3)
    public Vector<Course> getStudyingCourses(String user_id) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Course c "
                + "JOIN User_Enroll_Course uec ON c.course_id = uec.course_id "
                + "LEFT JOIN ( "
                + "    SELECT c.course_id "
                + "    FROM Course c "
                + "    JOIN User_Enroll_Course uec ON c.course_id = uec.course_id "
                + "    JOIN User_Practice up ON up.course_id = c.course_id AND up.user_id = ? "
                + "    JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id "
                + "    WHERE uec.user_id = ? AND uec.status = 1 AND rd.result > 3 "
                + "    GROUP BY c.course_id "
                + "    HAVING COUNT(DISTINCT up.TOP_id) = 3 "
                + ") AS completed_courses ON c.course_id = completed_courses.course_id "
                + "WHERE uec.user_id = ? AND uec.status = 1 AND completed_courses.course_id IS NULL";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setString(2, user_id);
            ps.setString(3, user_id);
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
    public Vector<Course> searchStudyingCoursesByName(String user_id, String courseName) {
        Vector<Course> courses = new Vector<>();
        String sql = "SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id "
                + "FROM Course c "
                + "JOIN User_Enroll_Course uec ON c.course_id = uec.course_id "
                + "LEFT JOIN ( "
                + "    SELECT up.course_id "
                + "    FROM User_Practice up "
                + "    JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id "
                + "    WHERE up.user_id = ? AND rd.result > 3 "
                + "    GROUP BY up.course_id "
                + "    HAVING COUNT(DISTINCT up.TOP_id) = 3 "
                + ") AS completed_courses ON c.course_id = completed_courses.course_id "
                + "WHERE uec.user_id = ? AND uec.status = 1 "
                + "AND completed_courses.course_id IS NULL "
                + "AND LOWER(c.course_name) LIKE LOWER(?) ESCAPE '|'";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user_id);
            ps.setString(2, user_id);
            ps.setString(3, "%" + courseName + "%");
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
    public Vector<Course> filterStudyingCoursesByCategories(String userId, String[] categoryNames) {
        Vector<Course> courses = new Vector<>();
        StringBuilder sql = new StringBuilder("SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
                .append("FROM Course c ")
                .append("JOIN User_Enroll_Course uec ON c.course_id = uec.course_id ")
                .append("LEFT JOIN ( ")
                .append("   SELECT up.course_id ")
                .append("   FROM User_Practice up ")
                .append("   JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id ")
                .append("   WHERE up.user_id = ? AND rd.result > 3 ")
                .append("   GROUP BY up.course_id ")
                .append("   HAVING COUNT(DISTINCT up.TOP_id) = 3 ")
                .append(") AS completed_courses ON c.course_id = completed_courses.course_id ")
                .append("JOIN Category cat ON c.category_id = cat.category_id ")
                .append("WHERE uec.user_id = ? AND uec.status = 1 AND completed_courses.course_id IS NULL ");

        if (categoryNames != null && categoryNames.length > 0) {
            sql.append("AND cat.category_name IN (");
            for (int i = 0; i < categoryNames.length; i++) {
                sql.append("?");
                if (i < categoryNames.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }

        try {
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            ps.setString(1, userId);
            ps.setString(2, userId);
            if (categoryNames != null && categoryNames.length > 0) {
                for (int i = 0; i < categoryNames.length; i++) {
                    ps.setString(3 + i, categoryNames[i]);
                }
            }
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
                courses.add(course);
            }
        } catch (Exception e) {
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

    public Vector<Course> searchEnrolledCoursesByNameAndCategories(String userId, String courseName, String[] categoryNames) {
        Vector<Course> courses = new Vector<>();
        StringBuilder sql = new StringBuilder("SELECT c.* FROM User_Enroll_Course uec ")
                .append("JOIN Course c ON uec.course_id = c.course_id ")
                .append("JOIN Category cat ON c.category_id = cat.category_id ")
                .append("WHERE uec.user_id = ? AND c.course_name LIKE ? AND status=1 ");

        if (categoryNames != null && categoryNames.length > 0) {
            sql.append("AND cat.category_name IN (");
            for (int i = 0; i < categoryNames.length; i++) {
                sql.append("?");
                if (i < categoryNames.length - 1) {
                    sql.append(", ");
                }
            }
            sql.append(") ");
        }

        try {
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            ps.setString(1, userId);
            ps.setString(2, "%" + courseName + "%");

            if (categoryNames != null && categoryNames.length > 0) {
                for (int i = 0; i < categoryNames.length; i++) {
                    ps.setString(3 + i, categoryNames[i]);
                }
            }

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
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    public Vector<Course> searchCompletedCoursesByNameAndCategories(String userId, String courseName, String[] categoryNames) {
    Vector<Course> courses = new Vector<>();
    StringBuilder sql = new StringBuilder("SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
            .append("FROM Course c ")
            .append("JOIN (")
            .append("    SELECT uec.course_id ")
            .append("    FROM User_Enroll_Course uec ")
            .append("    WHERE uec.user_id = ? AND uec.status = 1")
            .append(") enrolled_courses ON c.course_id = enrolled_courses.course_id ")
            .append("JOIN User_Practice up ON up.course_id = c.course_id AND up.user_id = ? ")
            .append("JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id ")
            .append("JOIN Category cat ON c.category_id = cat.category_id ")
            .append("WHERE rd.result > 3 ");

    if (categoryNames != null && categoryNames.length > 0) {
        sql.append("AND cat.category_name IN (");
        for (int i = 0; i < categoryNames.length; i++) {
            sql.append("?");
            if (i < categoryNames.length - 1) {
                sql.append(", ");
            }
        }
        sql.append(") ");
    }

    sql.append("AND c.course_name LIKE ? ")
            .append("GROUP BY c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
            .append("HAVING COUNT(DISTINCT up.TOP_id) = 3");

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        ps.setString(1, userId);
        ps.setString(2, userId);
        int parameterIndex = 3;
        if (categoryNames != null && categoryNames.length > 0) {
            for (String categoryName : categoryNames) {
                ps.setString(parameterIndex++, categoryName);
            }
        }
        ps.setString(parameterIndex, "%" + courseName + "%");

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

public Vector<Course> searchStudyingCoursesByNameAndCategories(String userId, String courseName, String[] categoryNames) {
    Vector<Course> courses = new Vector<>();
    StringBuilder sql = new StringBuilder("SELECT DISTINCT c.course_id, c.course_name, c.description, c.create_at, c.update_at, c.active, c.created_by, c.category_id ")
            .append("FROM Course c ")
            .append("JOIN User_Enroll_Course uec ON c.course_id = uec.course_id ")
            .append("LEFT JOIN ( ")
            .append("   SELECT up.course_id ")
            .append("   FROM User_Practice up ")
            .append("   JOIN Result_Detail rd ON rd.user_practice_id = up.user_practice_id ")
            .append("   WHERE up.user_id = ? AND rd.result > 3 ")
            .append("   GROUP BY up.course_id ")
            .append("   HAVING COUNT(DISTINCT up.TOP_id) = 3 ")
            .append(") AS completed_courses ON c.course_id = completed_courses.course_id ")
            .append("JOIN Category cat ON c.category_id = cat.category_id ")
            .append("WHERE uec.user_id = ? AND uec.status = 1 AND completed_courses.course_id IS NULL ");

    if (categoryNames != null && categoryNames.length > 0) {
        sql.append("AND cat.category_name IN (");
        for (int i = 0; i < categoryNames.length; i++) {
            sql.append("?");
            if (i < categoryNames.length - 1) {
                sql.append(", ");
            }
        }
        sql.append(") ");
    }

    sql.append("AND LOWER(c.course_name) LIKE LOWER(?) ESCAPE '|'");

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        ps.setString(1, userId);
        ps.setString(2, userId);
        int parameterIndex = 3;
        if (categoryNames != null && categoryNames.length > 0) {
            for (String categoryName : categoryNames) {
                ps.setString(parameterIndex++, categoryName);
            }
        }
        ps.setString(parameterIndex, "%" + courseName + "%");

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

    public static void main(String[] args) {
//        LocalDate today = LocalDate.now();
//        Course course = new Course("test1", "no information", today.toString(), today.toString(), 1, 22, 1);
//        System.out.println(new DAOCourse().createCourse(course));
//        System.out.println(new DAOCourse().lastedCourseCreatedBy(22));

    }

}
