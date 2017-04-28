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
public class Employee extends Person{
    
    //properties
    private int wage;
    private String position;
    private Date date; // start date
    
    // Getters.
    public int getWage() { return wage; }
    public String getPosition() { return position; }
    public Date getDate() { return date; }

    // Setters.
    public void setRating(int wage) { this.wage = wage; }
    public void setPosition(String position) { this.position = position; }
    public void setDate(Date date) { this.date = date; } 
}
