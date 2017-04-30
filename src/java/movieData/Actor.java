/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movieData;

import java.io.Serializable;

/**
 *
 * @author ZheLin
 */
public class Actor implements Serializable {
    // properties
    private int id;
    private String FName;
    private String LName;
    private String gender;
    private int age;
    private int rating;
    
    // getters
    public int getId() { return id; }
    public String getFName() { return FName; }
    public String getLName() { return LName; }
    public String getGender() { return gender; }
    public int getAge() { return age; }
    public int getRating() { return rating; }
    
    // setters
    public void setId(int id) { this.id = id; }
    public void setFName(String FName) { this.FName = FName; }
    public void setLName(String LName) { this.LName = LName; }
    public void setGender(String gender) { this.gender = gender; }
    public void setAge(int age) { this.age = age; }
    public void setRating(int rating) { this.rating = rating; }
    
}
