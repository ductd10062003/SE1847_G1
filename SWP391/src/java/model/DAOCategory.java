package model;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;
import java.sql.SQLException;

public class DAOCategory extends DBConnect {

    public ArrayList<Category> getAllCategories2() {
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
    
    public Vector<Category> getCategoriesByName(String name){
        String sql = "select * from [category] where category_name like N'%"+name+"%'";
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
    
    
    public int updateCategory(Category category) {
        String sql = "UPDATE [category] SET category_name=?, update_at=?, active=? WHERE category_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategory_name());
            ps.setString(2, category.getDate_last_edited());
            ps.setInt(3, category.getActive());
            ps.setInt(4, category.getCategory_id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int addCategory(Category category) {
        String sql = "INSERT INTO category (category_name, create_at, update_at, active) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCategory_name());
            ps.setString(2, category.getDate_created());
            ps.setString(3, category.getDate_last_edited());
            ps.setInt(4, category.getActive());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public static void main(String[] args) {
        for(Category i : new DAOCategory().getCategoriesByName("ể")){
            System.out.println(i);
        }
    }
}
