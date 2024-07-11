package entity;

public class User {
    private int user_id;
    private String name, email, password;
    private int role, active;
    private String create_at;
    private int gender;
    public String dob, phone, image;
    private String course_name, description;
    private int course_id, count;
            
    public User() {
    }
    
    public User(String name) {
        this.name = name;
    } 
    
    public User(int user_id, String name,int role, int active, int gender,String phone, String email) {
        this.user_id = user_id;
        this.name = name;
        this.role = role;
        this.active = active;
        this.gender = gender;
        this.phone = phone;
        this.email = email;       
    }
    
    public User(String name,int user_id,int role, int count) {
        this.name = name;
        this.user_id = user_id;
        this.role = role;
        this.count = count;
    }

    public User(int user_id, String name, String email, String password, int role, int active, String create_at, int gender, String dob, String phone, String image) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.active = active;
        this.create_at = create_at;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.image = image;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", name=" + name + ", email=" + email + ", password=" + password + ", role=" + role + ", active=" + active + ", create_at=" + create_at + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", image=" + image + '}';
    }

}
