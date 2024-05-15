package entity;

public class User {
    private int user_id;
    private String name, email, password;
    private int role, status;

    public User() {
    }

    public User(int user_id, String name, String email, String password, int role, int status) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", name=" + name + ", email=" + email + ", password=" + password + ", role=" + role + ", status=" + status + '}';
    }
    
    
}
