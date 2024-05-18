package entity;

public class Category {
    private int category_id;
    private String category_name, date_created, date_last_edited;
    private int active;

    public Category() {
    }

    public Category(int category_id, String category_name, String date_created, String date_last_edited, int active) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.date_created = date_created;
        this.date_last_edited = date_last_edited;
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

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getDate_last_edited() {
        return date_last_edited;
    }

    public void setDate_last_edited(String date_last_edited) {
        this.date_last_edited = date_last_edited;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "Category{" + "category_id=" + category_id + ", category_name=" + category_name + ", date_created=" + date_created + ", date_last_edited=" + date_last_edited + ", active=" + active + '}';
    }
    
    
    
}
