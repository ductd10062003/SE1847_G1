package model;

import controller.authenciation.encrypt.PasswordEncryptor;
import entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class DAOUser extends DBConnect {

    //getUserByEmail
    public User getUserByEmail(String email) {
        User user = null;
        String sql = "select * from [user] where email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return user;
    }

    public Vector<User> getAllUsers() {
        Vector<User> vector = new Vector<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public User getUserByID(int user_id) {
        User user = new User();
        String sql = "select * from [user] where user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public ArrayList<User> getTop6Mentor() {
        ArrayList<User> user = new ArrayList<>();
        String sql = "SELECT TOP 6 u.name, u.user_id, u.role, COUNT(c.course_name) AS total_courses\n"
                + "FROM [User] u\n"
                + "LEFT JOIN Course c ON u.user_id = c.created_by\n"
                + "WHERE u.role = 2\n"
                + "GROUP BY u.user_id, u.name, u.role\n"
                + "ORDER BY total_courses DESC;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.add(new User(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public User getUserByCourseID(int course_id) {
        User user = new User();
        String sql = "select name\n"
                + "from Course c inner join [User] u\n"
                + "on c.created_by = u.user_id\n"
                + "where course_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getString(1));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    // getUserByUsername
    public User getUserByUsername(String username) {
        User user = null;
        String sql = "select * from [user] where name = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public void createUser(User user) {

        String sql = "insert into [user]([name], email, [password], role, active, create_at, gender, dob, phone) values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            String securePassword = PasswordEncryptor.generateSecurePassword(user.getPassword());
            ps.setString(3, securePassword);
            ps.setInt(4, user.getRole());
            ps.setInt(5, 1);
            ps.setString(6, java.time.LocalDate.now().toString());
            ps.setInt(7, user.getGender());
            ps.setString(8, user.getDob());
            ps.setString(9, user.phone);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateUserActiveInfo(User user) {
        String sql = "UPDATE [User]\n"
                + "SET active = ?\n"
                + "WHERE user_id = ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user.getActive());
            ps.setInt(2, user.getUser_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean updateUser(User user) {
        String sql = "update [user] set [password] = ? where user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            String securePassword = PasswordEncryptor.generateSecurePassword(user.getPassword());
            ps.setString(1, securePassword);
            ps.setInt(2, user.getUser_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void updateProfile(int user_id, String name, int gender, String dob, String phone, String email) {
        String sql = "UPDATE [User] SET name =?,gender=?,dob=?,phone =?,email=? WHERE USER_ID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, gender);
            ps.setString(3, dob);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setInt(6, user_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Object searchMentor(String keyword) {
        ArrayList<User> user = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM [User] \n"
                + "WHERE (name LIKE ?\n"
                + "   OR email LIKE ?\n"
                + "   OR phone LIKE ?)\n"
                + "AND [User].role = 2;";

        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public ArrayList<User> getAllMentors() {
        ArrayList<User> user = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM [User] \n"
                + "WHERE [User].role = 2;";
        return getUser(user, sql);
    }

    private ArrayList<User> getUser(ArrayList<User> user, String sql) {
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public static void main(String[] args) {
        User user = new DAOUser().getUserByID(21);
        user.setActive(0);
        new DAOUser().updateUserActiveInfo(user);
        user = new DAOUser().getUserByID(21);
        System.out.println(user.getActive());
    }

}
