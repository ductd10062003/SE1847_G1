package model;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAOCategory extends DBConnect {

    public ArrayList<Category> getAllCategories() {
        String sql = "select * from [category]";
        ArrayList<Category> category = new ArrayList();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return category;
    }
}
