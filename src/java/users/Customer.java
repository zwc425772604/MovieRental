/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;
import java.util.Date;
/**
 *
 * @author ZheLin
 */
public class Customer extends Person{
    //properties
    private String email;
    private long card; // credit card number
    private int rating;
    private String type; // account type
    private long account; // account number
    private Date date; // account created date
    
    // Getters.
    public String getEmail() { return email; }
    public long getCard() { return card; }
    public int getRating() { return rating; }
    public String getType() { return type; }
    public long getAccount() { return account; }
    public Date getDate() { return date; }

    // Setters.
    public void setEmail(String email) { this.email = email; }
    public void setCard(long card) { this.card = card; }
    public void setRating(int rating) { this.rating = rating; }
    public void setType(String type) { this.type = type; }
    public void setAccount(long account) { this.account = account; }
    public void setDate(Date date) { this.date = date; }    
}
