package entity;

public class Message {
    private int messager;
    private String content;
    private int receiver, message_id;
    private String create_at;

    public Message() {
    }

    public Message(int messager, String content, int receiver, int message_id, String create_at) {
        this.messager = messager;
        this.content = content;
        this.receiver = receiver;
        this.message_id = message_id;
        this.create_at = create_at;
    }

    public int getMessager() {
        return messager;
    }

    public void setMessager(int messager) {
        this.messager = messager;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    @Override
    public String toString() {
        return "Message{" + "messager=" + messager + ", content=" + content + ", receiver=" + receiver + ", message_id=" + message_id + '}';
    }
    
    
    
}
