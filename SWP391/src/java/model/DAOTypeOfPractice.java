package model;

import entity.TypeOfPractice;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DAOTypeOfPractice extends DBConnect {

    public Vector<TypeOfPractice> getAllTypeOfPractices() {
        String sql = "select * from [Type_Of_Practice]";
        Vector<TypeOfPractice> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new TypeOfPractice(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
    
    public Vector<TypeOfPractice> getAllTypeOfPracticesByTOPID(int id) {
        String sql = "select * from [Type_Of_Practice] where TOP_id = ?";
        Vector<TypeOfPractice> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new TypeOfPractice(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
}
