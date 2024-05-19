package model;
import entity.Quiz;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOQuiz extends DBConnect{
    public Vector<Quiz> getAllQuizs(){
        String sql = "select * from quiz";
        Vector<Quiz> vector = new Vector<>();
        try {
            PreparedStatement ps =conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vector.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            return null;
        }
        
        return vector;
    }
    
    public Vector<Quiz> getQuizsByCourseID(int course_id){
        String sql = "select * from quiz where course_id = ?";
        Vector<Quiz> vector = new Vector<>();
        try {
            PreparedStatement ps =conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vector.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            return null;
        }
        
        return vector;
    }
    
}
