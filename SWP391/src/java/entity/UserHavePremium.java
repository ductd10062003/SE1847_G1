/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ductd
 */
public class UserHavePremium {

    private int UHP_id,
            user_id,
            premium_id;
    private String create_at,
            end_at;
    private float actual_price;

    public UserHavePremium() {
    }
    
    public UserHavePremium(float price) {
        this.actual_price = price;
    }

    public UserHavePremium(int UHP_id, int user_id, int premium_id, String create_at, String end_at, float actual_price) {
        this.UHP_id = UHP_id;
        this.user_id = user_id;
        this.premium_id = premium_id;
        this.create_at = create_at;
        this.end_at = end_at;
        this.actual_price = actual_price;
    }

    public int getUHP_id() {
        return UHP_id;
    }

    public void setUHP_id(int UHP_id) {
        this.UHP_id = UHP_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPremium_id() {
        return premium_id;
    }

    public void setPremium_id(int premium_id) {
        this.premium_id = premium_id;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getEnd_at() {
        return end_at;
    }

    public void setEnd_at(String end_at) {
        this.end_at = end_at;
    }

    public float getActual_price() {
        return actual_price;
    }

    public void setActual_price(float actual_price) {
        this.actual_price = actual_price;
    }

    
}
