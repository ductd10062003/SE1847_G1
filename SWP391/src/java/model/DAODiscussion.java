package model;

import entity.Category;
import entity.Discussion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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



//    title       nvarchar(500) NOT NULL,
//    content     nvarchar(500) NOT NULL,
//    create_at   date          NOT NULL,
//    update_at   date          NOT NULL,
//    active      bit           NOT NULL,
//    user_id     int           NOT NULL,
//    discussion_id int IDENTITY NOT NULL,
//    category_id int           NOT NULL,
//    PRIMARY KEY (discussion_id)
    public ArrayList<Discussion> getAllDiscussions() {
        String query = "SELECT * FROM Discussion";
        ArrayList<Discussion> discussions = new ArrayList<>();
        try{
            ResultSet rs = conn.prepareStatement(query).executeQuery();
            while (rs.next()){
                discussions.add(new Discussion(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return discussions;
    }

    public ArrayList<Discussion> getDiscussionsByKeyword(String keyword) {
        String query = "SELECT * FROM Discussion WHERE title LIKE ? OR content LIKE ?";
        String setKeyword = "%" + keyword + "%"; // No need for N' prefix
        ArrayList<Discussion> discussions = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, setKeyword);
            ps.setString(2, setKeyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                discussions.add(new Discussion(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return discussions;
    }


    public ArrayList<Discussion> getDiscussionsByCategories(String[] categories) {
        if (categories == null || categories.length == 0) {
            return new ArrayList<>(); // Return an empty list if no categories are provided
        }

        // Build the query with the appropriate number of placeholders
        StringBuilder query = new StringBuilder(
                "SELECT Discussion.title, Discussion.content, Discussion.create_at, Discussion.update_at, Discussion.active, " +
                        "Discussion.user_id, Discussion.discussion_id, Discussion.category_id, DiscussionCategory.category_name " +
                        "FROM Discussion JOIN DiscussionCategory ON Discussion.category_id = DiscussionCategory.category_id " +
                        "WHERE DiscussionCategory.category_name IN ("
        );

        for (int i = 0; i < categories.length; i++) {
            query.append("?");
            if (i < categories.length - 1) {
                query.append(", ");
            }
        }
        query.append(")");

        ArrayList<Discussion> discussions = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query.toString());
            for (int i = 0; i < categories.length; i++) {
                ps.setString(i + 1, categories[i]);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                discussions.add(new Discussion(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return discussions;
    }


    public ArrayList<Discussion> getDiscussionsByKeywordAndCategories(String keyword, String[] categories) {
        if (categories == null || categories.length == 0) {
            return new ArrayList<>(); // Return an empty list if no categories are provided
        }

        // Build the query with the appropriate number of placeholders for categories
        StringBuilder query = new StringBuilder(
                "SELECT DISTINCT Discussion.title, Discussion.content, Discussion.create_at, Discussion.update_at, " +
                        "Discussion.active, Discussion.user_id, Discussion.discussion_id, Discussion.category_id, " +
                        "DiscussionCategory.category_name FROM Discussion JOIN DiscussionCategory ON " +
                        "Discussion.category_id = DiscussionCategory.category_id WHERE (Discussion.title LIKE ? OR Discussion.content LIKE ?) " +
                        "AND DiscussionCategory.category_name IN ("
        );

        for (int i = 0; i < categories.length; i++) {
            query.append("?");
            if (i < categories.length - 1) {
                query.append(", ");
            }
        }
        query.append(")");

        ArrayList<Discussion> discussions = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query.toString());
            String setKeyword = "%" + keyword + "%";
            ps.setString(1, setKeyword);
            ps.setString(2, setKeyword);

            for (int i = 0; i < categories.length; i++) {
                ps.setString(i + 3, categories[i]); // Categories start from the 3rd parameter
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                discussions.add(new Discussion(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return discussions;
    }

    public int getCommentCount(int discussion_id){
        String query = "SELECT COUNT(*) FROM Comment WHERE discussion_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, discussion_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    public String getHostUser(int discussion_id){
        // Select username from user table where user_id = (Select user_id from discussion table where discussion_id = ?)
        String query = "SELECT u.name " +
                "FROM [User] u " +
                "JOIN Discussion d ON u.user_id = d.user_id " +
                "WHERE d.discussion_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, discussion_id);
            System.out.println("DiscussID: " + discussion_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        DAODiscussion dao = new DAODiscussion();
//        Get the current date and time
//        java.util.Date date = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
//        Discussion diss = new Discussion("title", "content", timestamp.toString(), timestamp.toString(), true, 1, 1, 1);
//        dao.insertDiscussion(diss);
//        String[] categories = {"Câu hỏi về cơ thể", "Câu hỏi về ẩm thực"};
//
//        System.out.println("Discussions by keyword and categories:" );
//        ArrayList<Discussion> discussionsByKeywordAndCategories = dao.getDiscussionsByKeywordAndCategories("cơ thể", categories);
//        for(Discussion discussion : discussionsByKeywordAndCategories)
//            System.out.println(discussion.getTitle() + "\\" + discussion.getContent());
//        System.out.println("Discussions by keyword:");
//        ArrayList<Discussion> discussionsByKeyword = dao.getDiscussionsByKeyword("Câu");
//        for(Discussion discussion : discussionsByKeyword){
//            System.out.println(discussion.getTitle() + "\\" + discussion.getContent());
//        }
//        System.out.println("Discussions by categories:" );
//        ArrayList<Discussion> discussionsByCategories = dao.getDiscussionsByCategories(categories);
//        for(Discussion discussion : discussionsByCategories){
//            System.out.println(discussion.getTitle() + "\\" + discussion.getContent() + "\\" + discussion.getUpdate_at());
//        }
        System.out.println("count discussions: " + dao.getHostUser(1));
    }
    
    public Discussion getDiscussionById(int i) {
        String query = "SELECT * FROM Discussion WHERE discussion_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, i);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Discussion(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)
                );
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
