package entity;

public class Quiz {
    private int course_id, flashcard_id, quiz_id;

    public Quiz(int course_id, int flashcard_id, int quiz_id) {
        this.course_id = course_id;
        this.flashcard_id = flashcard_id;
        this.quiz_id = quiz_id;
    }

    public Quiz() {
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getFlashcard_id() {
        return flashcard_id;
    }

    public void setFlashcard_id(int flashcard_id) {
        this.flashcard_id = flashcard_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    @Override
    public String toString() {
        return "Quiz{" + "course_id=" + course_id + ", flashcard_id=" + flashcard_id + ", quiz_id=" + quiz_id + '}';
    }
    
    
    
}
