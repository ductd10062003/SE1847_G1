package entity;

public class FlashCard {
    private int flashcard_id;
    private String question, answer, create_at, update_at;
    private int active, category_id;
    public String image;

    public FlashCard(int flashcard_id, String question, String answer, String create_at, String update_at, int active, int category_id, String image) {
        this.flashcard_id = flashcard_id;
        this.question = question;
        this.answer = answer;
        this.create_at = create_at;
        this.update_at = update_at;
        this.active = active;
        this.category_id = category_id;
        this.image = image;
    }

    public FlashCard() {
    }

    public int getFlashcard_id() {
        return flashcard_id;
    }

    public void setFlashcard_id(int flashcard_id) {
        this.flashcard_id = flashcard_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
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

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "FlashCard{" + "flashcard_id=" + flashcard_id + ", question=" + question + ", answer=" + answer + ", create_at=" + create_at + ", update_at=" + update_at + ", active=" + active + ", category_id=" + category_id + ", image=" + image + '}';
    }
    
    
    
}
