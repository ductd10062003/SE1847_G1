package entity;

public class TypeOfPractice {
    private int typeOfPractice_id;
    private String typeOfPractice_name;
    private int active;

    public TypeOfPractice(int typeOfPractice_id, String typeOfPractice_name, int active) {
        this.typeOfPractice_id = typeOfPractice_id;
        this.typeOfPractice_name = typeOfPractice_name;
        this.active = active;
    }

    public TypeOfPractice() {
    }

    public int getTypeOfPractice_id() {
        return typeOfPractice_id;
    }

    public void setTypeOfPractice_id(int typeOfPractice_id) {
        this.typeOfPractice_id = typeOfPractice_id;
    }

    public String getTypeOfPractice_name() {
        return typeOfPractice_name;
    }

    public void setTypeOfPractice_name(String typeOfPractice_name) {
        this.typeOfPractice_name = typeOfPractice_name;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "TypeOfPractice{" + "typeOfPractice_id=" + typeOfPractice_id + ", typeOfPractice_name=" + typeOfPractice_name + ", active=" + active + '}';
    }
    
    
    
}
