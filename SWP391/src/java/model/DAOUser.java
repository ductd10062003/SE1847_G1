package model;

import entity.User;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOUser extends DBConnect {

    public Vector<User> getAllUsers() {
        Vector<User> vector = new Vector<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8), rs.getDate(9), rs.getString(10), rs.getString(11)));
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
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getInt(6),
                        rs.getDate(7), rs.getInt(8), rs.getDate(9),
                        rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [name] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, user.getName());
            ps.setInt(2, user.getGender());
            ps.setDate(3, user.getDob());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getImage());
            ps.setInt(6, user.getUser_id());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public User ValidateCustomer(String email, String password) {
        String sql = "SELECT * FROM [user]\n"
                + "WHERE email = ? and password = ?";
        User user = null;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getInt(6),
                        rs.getDate(7), rs.getInt(8), rs.getDate(9),
                        rs.getString(10), rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
    }
public boolean updatePassword(String newPassword, int userId) {
        String sql = "UPDATE [dbo].[User]\n"
                + " SET [password] = ?\n"
                + " WHERE [user_id] = ?";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate()> 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
