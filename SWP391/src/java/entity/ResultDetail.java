package entity;

public class ResultDetail {

    private float result;
    private int user_practice_id, time, result_detail_id;
    public String name;
    public int user_id;
    public int typeOfPractice_id;

    public int getTypeOfPractice_id() {
        return typeOfPractice_id;
    }

    public void setTypeOfPractice_id(int typeOfPractice_id) {
        this.typeOfPractice_id = typeOfPractice_id;
    }
    public String typeOfPractice_name;

    public ResultDetail() {
    }

    public ResultDetail(String name, int user_id, float result, int time) {
        this.name = name;
        this.user_id = user_id;
        this.result = result;
        this.time = time;
    }

    public ResultDetail(String name, int user_id, String typeOfPractice_name, float result, int time) {
        this.name = name;
        this.user_id = user_id;
        this.typeOfPractice_name = typeOfPractice_name;
        this.result = result;
        this.time = time;
    }

    public ResultDetail(float result, int user_practice_id, int time, int result_detail_id) {
        this.result = result;
        this.user_practice_id = user_practice_id;
        this.time = time;
        this.result_detail_id = result_detail_id;
    }

    public String getTypeOfPractice_name() {
        return typeOfPractice_name;
    }

    public void setTypeOfPractice_name(String typeOfPractice_name) {
        this.typeOfPractice_name = typeOfPractice_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public float getResult() {
        return result;
    }

    public void setResult(float result) {
        this.result = result;
    }

    public int getUser_practice_id() {
        return user_practice_id;
    }

    public void setUser_practice_id(int user_practice_id) {
        this.user_practice_id = user_practice_id;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getResult_detail_id() {
        return result_detail_id;
    }

    public void setResult_detail_id(int result_detail_id) {
        this.result_detail_id = result_detail_id;
    }

    @Override
    public String toString() {
        return "ResultDetail{" + "result=" + result + ", user_practice_id=" + user_practice_id + ", time=" + time + ", result_detail_id=" + result_detail_id + '}';
    }

}
