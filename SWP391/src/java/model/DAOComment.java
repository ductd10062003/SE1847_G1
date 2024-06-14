package model;

import entity.Comment;

import java.sql.PreparedStatement;

public class DAOComment extends DBConnect{
    public DAOComment() {
        super();
    }
    public void insertComment(Comment comment){
        try {
            String query = "INSERT INTO Comment(content, user_id, discussion_id, create_at) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, comment.getContent());
            preparedStatement.setInt(2, comment.getUser_id());
            preparedStatement.setInt(3, comment.getDiscussion_id());
            preparedStatement.setInt(4, comment.getCreate_at());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void updateComment(Comment comment){
        try {
            String query = "UPDATE Comment SET content = ?, user_id = ?, discussion_id = ?, create_at = ? WHERE Comment_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, comment.getContent());
            preparedStatement.setInt(2, comment.getUser_id());
            preparedStatement.setInt(3, comment.getDiscussion_id());
            preparedStatement.setInt(4, comment.getCreate_at());
            preparedStatement.setInt(5, comment.getComment_id());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void deleteComment(int comment_id){
        try {
            String query = "DELETE FROM Comment WHERE Comment_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, comment_id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    public void getComment(int comment_id){
        try {
            String query = "SELECT * FROM Comment WHERE Comment_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, comment_id);
            preparedStatement.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        DAOComment daoComment = new DAOComment();
        Comment comment = new Comment("content", 1, 1, 1, 1);
        daoComment.insertComment(comment);
    }
}
