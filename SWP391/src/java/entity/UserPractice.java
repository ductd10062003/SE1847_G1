package entity;

public class UserPractice {
    private int user_id, course_id, typeOfPractice_id, userPractice_id, times;

    public UserPractice() {
    }

    public UserPractice(int user_id, int course_id, int typeOfPractice_id, int userPractice_id) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.typeOfPractice_id = typeOfPractice_id;
        this.userPractice_id = userPractice_id;
    }

    public UserPractice(int user_id, int course_id, int typeOfPractice_id, int userPractice_id, int times) {
        this.user_id = user_id;
        this.course_id = course_id;
        this.typeOfPractice_id = typeOfPractice_id;
        this.userPractice_id = userPractice_id;
        this.times = times;
    }
    
    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
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

    public int getTypeOfPractice_id() {
        return typeOfPractice_id;
    }

    public void setTypeOfPractice_id(int typeOfPractice_id) {
        this.typeOfPractice_id = typeOfPractice_id;
    }

    public int getUserPractice_id() {
        return userPractice_id;
    }

    public void setUserPractice_id(int userPractice_id) {
        this.userPractice_id = userPractice_id;
    }

    @Override
    public String toString() {
        return "UserPractice{" + "user_id=" + user_id + ", course_id=" + course_id + ", typeOfPractice_id=" + typeOfPractice_id + ", userPractice_id=" + userPractice_id + '}';
    }
    
    
}
