package entity;

public class Comment {
//    content    nvarchar(500) NOT NULL,
//    user_id    int           NOT NULL,
//    Comment_id int IDENTITY  NOT NULL,
//    discussion_id int        NOT NULL,
//    create_at  int           NOT NULL,
//    PRIMARY KEY (Comment_id)
    private String content;
    private int user_id;
    private int Comment_id;
    private int discussion_id;
    private String create_at;

    public Comment(String content, int user_id, int Comment_id, int discussion_id, String create_at) {
        this.content = content;
        this.user_id = user_id;
        this.Comment_id = Comment_id;
        this.discussion_id = discussion_id;
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
        return Comment_id;
    }

    public void setComment_id(int comment_id) {
        Comment_id = comment_id;
    }

    public int getDiscussion_id() {
        return discussion_id;
    }

    public void setDiscussion_id(int discussion_id) {
        this.discussion_id = discussion_id;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }
}
