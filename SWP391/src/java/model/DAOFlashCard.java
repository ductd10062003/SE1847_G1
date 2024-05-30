package model;

import entity.FlashCard;
import entity.Quiz;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DAOFlashCard extends DBConnect {

    public Vector<FlashCard> getAllFlashCards() {
        String sql = "select * from flashcard";
        Vector<FlashCard> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public FlashCard getFlashCardByID(int flashcard_id) {
        String sql = "select * from flashcard where flashcard_id = ?";
        FlashCard flashcard = new FlashCard();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                flashcard = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }
        return flashcard;
    }

    public Vector<FlashCard> getFlashCardByCourse(Vector<Quiz> quizzes) {
        Vector<FlashCard> vector = new Vector<>();
        for (Quiz quiz : quizzes) {
            try {
                String sql = "select * from flashcard where flashcard_id = ?";
                PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps.setInt(1, quiz.getFlashcard_id());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
                }
            } catch (Exception e) {
                return null;
            }
        }
        return vector;
    }

}
