package entity;

public class Reply {
    private int reply_id, user_id, reply_for;
    private String content;

    public Reply() {
    }

    public Reply(int reply_id, int user_id, int reply_for, String content) {
        this.reply_id = reply_id;
        this.user_id = user_id;
        this.reply_for = reply_for;
        this.content = content;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getReply_for() {
        return reply_for;
    }

    public void setReply_for(int reply_for) {
        this.reply_for = reply_for;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Reply{" + "reply_id=" + reply_id + ", user_id=" + user_id + ", reply_for=" + reply_for + ", content=" + content + '}';
    }
    
    
    
}
