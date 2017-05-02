/*
    The person object for the database
 */
package users;
import java.io.*;

/**
 *
 * @author ZheLin
 */
public class Person implements Serializable{
    // Properties.
    private long id; //It's account number for customers and ssn for employees
    private String FName;
    private String LName;
    private String address;
    private String city;
    private String state;
    private int zip;
    private long phone;


    // Getters.
    public long getId() { return id; }
    public String getFName() { return FName; }
    public String getLName() { return LName; }
    public String getAddress() { return address; }
    public String getCity() { return city; }
    public String getState() { return state; }
    public int getZip() { return zip; }
    public long getPhone() { return phone; }

   

    // Setters.
    public void setId(long id) { this.id = id; }
    public void setFName(String FName) { this.FName = FName; }
    public void setLName(String LName) { this.LName = LName; }
    public void setAddress(String address) { this.address = address; }
    public void setCity(String city) { this.city = city; }
    public void setState(String state) { this.state = state; }
    public void setZip(int zip) { this.zip = zip; }
    public void setPhone(long phone) { this.phone = phone; }
    
}
