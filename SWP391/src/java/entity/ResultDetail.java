package entity;

public class ResultDetail {
    private float result;
    private int user_practice_id, time, result_detail_id;

    public ResultDetail() {
    }

    public ResultDetail(float result, int user_practice_id, int time, int result_detail_id) {
        this.result = result;
        this.user_practice_id = user_practice_id;
        this.time = time;
        this.result_detail_id = result_detail_id;
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
