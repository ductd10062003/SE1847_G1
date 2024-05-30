package model;

import entity.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DAOCategory extends DBConnect{
    public Vector<Category> getAllCategories(){
        String sql = "select * from [category]";
        Vector<Category> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vector.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }
    
    public Category getCategoryByID(int category_id){
        String sql = "select * from [category] where category_id = ?";
        Category category = new Category();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, category_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                category = new Category(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
            return null;
        }
        return category;
    }
}
