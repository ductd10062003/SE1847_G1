package DAOTest;

import entity.Category;
import entity.Course;
import entity.Quiz;
import entity.TypeOfPractice;
import entity.User;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.DAOCategory;
import model.DAOCourse;
import model.DAOQuiz;
import model.DAOTypeOfPractice;
import model.DAOUser;

public class Test {
    public static void main(String[] args) {
        DAOUser daoUser = new DAOUser();
        DAOCategory daoCategory = new DAOCategory();
        DAOTypeOfPractice daoTOP = new DAOTypeOfPractice();
        DAOCourse daoCourse = new DAOCourse();
        DAOQuiz daoQuiz = new DAOQuiz();
        for(Quiz i : daoQuiz.getQuizsByCourseID(1)){
            System.out.println(i);
        }
        System.out.println(daoCategory.getCategoryByID(4));
        
//        LocalDate today = LocalDate.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
//        String formattedDate = today.format(formatter);
//        System.out.println("Today's date formatted: " + formattedDate);
    }
}
