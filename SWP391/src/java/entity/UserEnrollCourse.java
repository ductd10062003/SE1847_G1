package entity;

public class UserEnrollCourse {
    private int user_id, course_id, status;
    private String date;
    public UserEnrollCourse() {
    }

    public UserEnrollCourse(int user_id, int course_id, int status) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.status = status;
    }
    
    public UserEnrollCourse(int status){
        this.status = status;
    }
    
    public UserEnrollCourse(int user_id, int course_id, int status, String date) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.status = status;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    
    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserEnrollCourse{" + "user_id=" + user_id + ", course_id=" + course_id + ", status=" + status + '}';
    }
    
    
    
}
