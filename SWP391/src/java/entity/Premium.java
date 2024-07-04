
package entity;

/**
 *
 * @author ductd
 */
public class Premium {
    private int premium_id;
    private String premium_name;
    private float premium_price, discount;
    private int active, dayActive;

    public Premium() {
    }

    public Premium(int premium_id, String premium_name, float premium_price, float discount, int active, int dayActive) {
        this.premium_id = premium_id;
        this.premium_name = premium_name;
        this.premium_price = premium_price;
        this.discount = discount;
        this.active = active;
        this.dayActive = dayActive;
    }



    public int getDayActive() {
        return dayActive;
    }

    public void setDayActive(int dayActive) {
        this.dayActive = dayActive;
    }

    
    
    public int getPremium_id() {
        return premium_id;
    }

    public void setPremium_id(int premium_id) {
        this.premium_id = premium_id;
    }

    public String getPremium_name() {
        return premium_name;
    }

    public void setPremium_name(String premium_name) {
        this.premium_name = premium_name;
    }

    public float getPremium_price() {
        return premium_price;
    }

    public void setPremium_price(float premium_price) {
        this.premium_price = premium_price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
    
    
    
}
