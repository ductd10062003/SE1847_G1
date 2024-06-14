package model;

import entity.DiscussionCategory;

import java.sql.PreparedStatement;

public class DAODiscussionCategory extends DBConnect{
    public DAODiscussionCategory() {
        super();
    }
    public void insertDiscussionCategory(DiscussionCategory dissussionCategory){
        try {
            String query = "INSERT INTO DiscussionCategory(category_name, create_at, update_at, active) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, dissussionCategory.getCategory_name());
            preparedStatement.setString(2, dissussionCategory.getCreate_at());
            preparedStatement.setString(3, dissussionCategory.getUpdate_at());
            preparedStatement.setBoolean(4, dissussionCategory.isActive());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void updateDiscussionCategory(DiscussionCategory dissussionCategory){
        try {
            String query = "UPDATE DiscussionCategory SET category_name = ?, update_at = ?, active = ? WHERE category_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, dissussionCategory.getCategory_name());
            preparedStatement.setString(2, dissussionCategory.getUpdate_at());
            preparedStatement.setBoolean(3, dissussionCategory.isActive());
            preparedStatement.setInt(4, dissussionCategory.getCategory_id());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void deleteDiscussionCategory(int category_id){
        try {
            String query = "DELETE FROM DiscussionCategory WHERE category_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, category_id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void getDiscussionCategory(int category_id){
        try {
            String query = "SELECT * FROM DiscussionCategory WHERE category_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, category_id);
            preparedStatement.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        DAODiscussionCategory daoDiscussionCategory = new DAODiscussionCategory();
//        get the current date and time
        java.util.Date date = new java.util.Date();
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
        DiscussionCategory discussionCategory = new DiscussionCategory(1, "category_name", sqlTime.toString(), sqlTime.toString(), true);
        daoDiscussionCategory.insertDiscussionCategory(discussionCategory);
    }
}
