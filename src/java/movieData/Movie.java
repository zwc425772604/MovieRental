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
public class Movie implements Serializable{
    // properties
    private long id;
    private String title;
    private String genre;
    private double fee;
    private int copies;
    private int rating;
    
    // getters
    public long getId() { return id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public double getFee() { return fee; }
    public int getCopies() { return copies; }
    public int getRating() { return rating; }
    
    // setters
    public void setId(long id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setGenre(String genre) { this.genre = genre; }
    public void setFee(double fee) { this.fee = fee; }
    public void setCopies(int copies) { this.copies = copies; }
    public void setRating(int rating) { this.rating = rating; }
    
}
