package entity;

public class Course {
    private int user_id;
    private int course_id;
    private String course_name, description, created_at, update_at;
    private int active, created_by, category_id;
    private String name, email;
    private int role;
    private int gender;
    public String dob, phone;
    
    public Course() {
    }

    public Course(String course_name, String description) {
        this.course_name = course_name;
        this.description = description;
    }

    public Course(String name, int user_id, int role, int gender, String dob, String phone, String email, String course_name, String description) {
        this.name = name;
        this.user_id = user_id;
        this.role = role;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.course_name = course_name;
        this.description = description;
    }

    public Course(int course_id, String course_name, String description, String created_at, String update_at, int active, int created_by, int category_id) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.created_at = created_at;
        this.update_at = update_at;
        this.active = active;
        this.created_by = created_by;
        this.category_id = category_id;
    }

    public Course(String course_name,String description, String created_at, String update_at, int active, int created_by, int category_id) {
        this.course_name = course_name;
        this.description = description;
        this.created_at = created_at;
        this.update_at = update_at;
        this.active = active;
        this.created_by = created_by;
        this.category_id = category_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", course_name=" + course_name + ", description=" + description + ", created_at=" + created_at + ", update_at=" + update_at + ", active=" + active + ", created_by=" + created_by + ", category_id=" + category_id + '}';
    }

}
