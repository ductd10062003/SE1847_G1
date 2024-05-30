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

    public Vector<FlashCard> getFlashCardInCourse(Vector<Quiz> quizzes) {
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

    public FlashCard getFlashCardByQuestionName(String question) {
        FlashCard fl = null;
        try {
            String sql = "select * from flashcard where question = ? ";
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, question);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fl = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }

        return fl;
    }

    public Vector<FlashCard> getFlashCardByQuestionsNameAndCategory(String question,int categoryId) {
        Vector<FlashCard> vector = new Vector<>();
        try {
            String sql = "select * from flashcard where question like N'%"+question+"%' and category_id=?";
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }

        return vector;
    }
    
    public Vector<FlashCard> getFlashCardByRandomNumber(int random, int categoryId, String notIn) {
        String sql = "";
        if(notIn != null && notIn.length() == 0){
            sql = "select top "+random+" * from flashcard where category_id = ? order by NEWID()";
        }else{
             sql = "select top "+random+" * from flashcard where category_id = ? and flashcard_id not in "+notIn+" order by NEWID()";
        }
        Vector<FlashCard> vector = new Vector<>();
        try {            
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }

        return vector;
    }
    
    public int insertFlashCardsByList(Vector<FlashCard> vector) {
        String sql = "insert into flashcard(question,answer,create_at,update_at,active,Category_id)\n"
                + "values(?,?,?,?,?,?)";
        int n = 0;
        int i = 0;
        try {
            for (FlashCard fl : vector) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, fl.getQuestion());
                ps.setString(2, fl.getAnswer());
                ps.setString(3, fl.getCreate_at());
                ps.setString(4, fl.getUpdate_at());
                ps.setInt(5, fl.getActive());
                ps.setInt(6, fl.getCategory_id());
                i = ps.executeUpdate();
            }
            n++;
        } catch (Exception e) {
        }

        return n;
    }

    public static void main(String[] args) {
        for(FlashCard i: new DAOFlashCard().getFlashCardByRandomNumber(100, 2, "(0)")){
            System.out.println(i);
        }
    }

}
