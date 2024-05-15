package model;

import entity.User;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOUser extends DBConnect {

    public Vector<User> getAllUsers() {
        Vector<User> vectorUser = new Vector<>();
        String sql = "select * from [user]";
        try {
            PreparedStatement ps = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vectorUser.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            return null;
        }
        return vectorUser;
    }

    public User getUser(String email, String password) {
        User user = new User();
        String sql = "select * from [user] where [email]=? and [password]=?";
        try {
            PreparedStatement ps = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {
            return null;
        }
        return user;
    }

}
