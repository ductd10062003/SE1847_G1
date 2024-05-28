package model;

import entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DAOUser extends DBConnect {

    public Vector<User> getAllUsers() {
        Vector<User> vector = new Vector<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8), rs.getDate(9), rs.getString(10), rs.getString(11)));
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
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8), rs.getDate(9), rs.getString(10), rs.getString(11));
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
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7), rs.getInt(8), rs.getDate(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }


}
