package model;

import entity.Comment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class DAOComment extends DBConnect{
    // CRUD, GetCommentByDiscussionId(int discussion_id)
    public void insertComment(Comment comment){
        try {
            String query = "INSERT INTO Comment(content, user_id, discussion_id, create_at) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, comment.getContent());
            preparedStatement.setInt(2, comment.getUser_id());
            preparedStatement.setInt(3, comment.getDiscussion_id());
            preparedStatement.setString(4, comment.getCreate_at());
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
            preparedStatement.setString(4, comment.getCreate_at());
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
    public ArrayList<Comment> getCommentByDiscussionId(int discussion_id){
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            String query = "SELECT * FROM Comment WHERE discussion_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, discussion_id);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                comments.add(new Comment(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return comments;
    }
    public Comment getCommentById(int comment_id){
        Comment comment = new Comment();
        try {
            String query = "SELECT * FROM Comment WHERE Comment_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, comment_id);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                comment = new Comment(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return comment;
    }

    public static void main(String[] args) {
        DAOComment daoComment = new DAOComment();
//        java.util.Date date = new java.util.Date();
//        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
//        Comment comment = new Comment("content", 1, 1, 1, sqlTime.toString());
//        daoComment.insertComment(comment);
        System.out.println("Test get comments");
        ArrayList<Comment> comments = daoComment.getCommentByDiscussionId(1);
        for (Comment comment : comments){
            System.out.println(comment.getContent());
        }
    }
}
