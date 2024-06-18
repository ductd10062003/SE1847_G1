package entity;

public class Discussion {
//    title       nvarchar(500) NOT NULL,
//    content     nvarchar(500) NOT NULL,
//    create_at   date          NOT NULL,
//    update_at   date          NOT NULL,
//    active      bit           NOT NULL,
//    user_id     int           NOT NULL,
//    discussion_id int IDENTITY NOT NULL,
//    category_id int           NOT NULL,
//    PRIMARY KEY (discussion_id)
    private String title;
    private String content;
    private String create_at;
    private String update_at;
    private boolean active;
    private int user_id;
    private int discussion_id;
    private int category_id;

    public Discussion(String title, String content, String create_at, String update_at, boolean active, int user_id, int discussion_id, int category_id) {
        this.title = title;
        this.content = content;
        this.create_at = create_at;
        this.update_at = update_at;
        this.active = active;
        this.user_id = user_id;
        this.discussion_id = discussion_id;
        this.category_id = category_id;
    }

    public Discussion() {
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getCreate_at() {
        return create_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public boolean isActive() {
        return active;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getDiscussion_id() {
        return discussion_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setDiscussion_id(int discussion_id) {
        this.discussion_id = discussion_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
