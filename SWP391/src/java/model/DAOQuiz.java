package model;

import entity.Quiz;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
    
    public int createQuiz(int course_id, Vector<Integer> flashcard_ids){
        String sql = "insert into Quiz(course_id,flashcard_id)"
                + "values (?,?)";
        int n = 0;
        for(int i = 0; i < flashcard_ids.size(); i++){
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, course_id);
                ps.setInt(2, flashcard_ids.get(i));
                n = ps.executeUpdate();
            } catch (Exception e) {
            }
        }
        return n;
    }
    
    public static void main(String[] args) {
        Vector<Integer> v = new Vector<>(); v.add(0);v.add(1);
        System.out.println(new DAOQuiz().createQuiz(6, v));
    }
    
}
