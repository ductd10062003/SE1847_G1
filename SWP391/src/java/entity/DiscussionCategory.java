package entity;

public class DiscussionCategory {
//    category_id   int IDENTITY  NOT NULL,
//    category_name nvarchar(500) NOT NULL UNIQUE,
//    create_at     date          NOT NULL,
//    update_at     date          NOT NULL,
//    active        bit           NOT NULL,
//    PRIMARY KEY (category_id)
    private int category_id;
    private String category_name;
    private String create_at;
    private String update_at;
    private boolean active;

    public DiscussionCategory() {
    }

    public DiscussionCategory(int category_id, String category_name, String create_at, String update_at, boolean active) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.create_at = create_at;
        this.update_at = update_at;
        this.active = active;
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

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
