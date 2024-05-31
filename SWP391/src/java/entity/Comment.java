package entity;

public class Comment {
    private String content;
    private int user_id, comment_id;
    private String create_at;

    public Comment(String content, int user_id, int comment_id, String create_at) {
        this.content = content;
        this.user_id = user_id;
        this.comment_id = comment_id;
        this.create_at = create_at;
    }

    public Comment() {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "Comment{" + "content=" + content + ", user_id=" + user_id + ", comment_id=" + comment_id + ", create_at=" + create_at + '}';
    }
    
    
    
}
