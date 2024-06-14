package model;

import entity.Discussion;

import java.sql.PreparedStatement;

public class DAODiscussion extends DBConnect{
    public DAODiscussion() {
        super();
    }
//    insert into Discussion(title, content, create_at, update_at, active, user_id, category_id)

    public void insertDiscussion(Discussion diss){
        try {
            String query = "INSERT INTO Discussion(title, content, create_at, update_at, active, user_id, category_id) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, diss.getTitle());
            preparedStatement.setString(2, diss.getContent());
            preparedStatement.setString(3, diss.getCreate_at());
            preparedStatement.setString(4, diss.getUpdate_at());
            preparedStatement.setBoolean(5, diss.isActive());
            preparedStatement.setInt(6, diss.getUser_id());
            preparedStatement.setInt(7, diss.getCategory_id());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public void updateDiscussion(Discussion diss){
        try {
            String query = "UPDATE Discussion SET title = ?, content = ?, update_at = ?, active = ?, user_id = ?, category_id = ? WHERE discussion_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, diss.getTitle());
            preparedStatement.setString(2, diss.getContent());
            preparedStatement.setString(3, diss.getUpdate_at());
            preparedStatement.setBoolean(4, diss.isActive());
            preparedStatement.setInt(5, diss.getUser_id());
            preparedStatement.setInt(6, diss.getCategory_id());
            preparedStatement.setInt(7, diss.getDiscussion_id());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void deleteDiscussion(int discussion_id){
        try {
            String query = "DELETE FROM Discussion WHERE discussion_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, discussion_id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void getDiscussion(int discussion_id){
        try {
            String query = "SELECT * FROM Discussion WHERE discussion_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, discussion_id);
            preparedStatement.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        DAODiscussion dao = new DAODiscussion();
//        Get the current date and time
        java.util.Date date = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
        Discussion diss = new Discussion("title", "content", timestamp.toString(), timestamp.toString(), true, 1, 1, 1);
        dao.insertDiscussion(diss);
    }
}
