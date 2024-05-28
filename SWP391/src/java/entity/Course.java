package entity;

public class Course {
    private int course_id;
    private String course_name, description,created_at,update_at, category_name, image;
    private int	active, created_by, category_id;

    public Course() {
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
    
    public Course(String course_name, String description, String created_at, String update_at, int active, int created_by, int category_id) {
        this.course_name = course_name;
        this.description = description;
        this.created_at = created_at;
        this.update_at = update_at;
        this.active = active;
        this.created_by = created_by;
        this.category_id = category_id;
    }
    
    public Course(int course_id, String course_name, String description, String category_name, String image) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.description = description;
        this.category_name = category_name;
        this.image = image;
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

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    
    
    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", course_name=" + course_name + ", description=" + description + ", created_at=" + created_at + ", update_at=" + update_at + ", active=" + active + ", created_by=" + created_by + ", category_id=" + category_id + '}';
    }
    
    
    
}
