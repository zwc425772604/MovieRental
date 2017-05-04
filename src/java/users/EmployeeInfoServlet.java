/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import movieData.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustomerInfoServlet
 */
public class EmployeeInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            String account = "" + session.getAttribute("login");
            long accountNum = Long.parseLong(account);

            String mysJDBCDriver = "com.mysql.jdbc.Driver";
            String mysURL = "jdbc:mysql://127.0.0.1:3306/cse305";
            String mysUserID = "root";
            String mysPassword = "1234";

            //List<Movie> rentList = new ArrayList<Movie>();
            //List<Movie> wishList = new ArrayList<Movie>();
            //List<Movie> topList = new ArrayList<Movie>();
            Employee employee = new Employee();
            java.sql.Connection conn = null;
            try {
                    Class.forName(mysJDBCDriver).newInstance();
                    java.util.Properties sysprops = System.getProperties();
                    sysprops.put("user", mysUserID);
                    sysprops.put("password", mysPassword);

                    // connect to the database
                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);

                    // get Employee informations
                    java.sql.Statement stmt1 = conn.createStatement();
                    java.sql.Statement stmt2 = conn.createStatement();

                    java.sql.ResultSet cusInfo = stmt1.executeQuery("SELECT Person.FirstName, Person.LastName, Person.Address,Person.City,Person.State, Person.Zip, Person.Phone, Employee.StartDate, Employee.Position, Employee.HourlyRate FROM Employee, Person WHERE Employee.SSN = Person.ID AND Person.ID = '"+ accountNum + "'");
                    if(cusInfo.next()) {
                        employee.setId(accountNum);
                        employee.setFName(cusInfo.getString(1));
                        employee.setLName(cusInfo.getString(2));
                        employee.setAddress(cusInfo.getString(3));
                        employee.setCity(cusInfo.getString(4));
                        employee.setState(cusInfo.getString(5));
                        employee.setZip(cusInfo.getInt(6));
                        employee.setPhone(cusInfo.getLong(7));
                        employee.setDate(cusInfo.getDate(8));
                        employee.setPosition(cusInfo.getString(9));
                        employee.setWage(cusInfo.getInt(10));
                    }
                    
                    /*
                    // get the movies currently holding
                    java.sql.ResultSet rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
                    while(rentInfo.next()) {
                        // get the data for every movie in the result set
                        long movieId = rentInfo.getLong(2);
                        Date date = rentInfo.getDate(4);
                        java.sql.ResultSet movieInfo = stmt2.executeQuery("SELECT * FROM Movie WHERE ID = '" + rentInfo.getString(2) + "'");
                        if(movieInfo.next()) {
                            Movie movie = new Movie();
                            movie.setId(movieId);
                            movie.setTitle(movieInfo.getString(2));
                            movie.setGenre(movieInfo.getString(3));
                            movie.setFee(movieInfo.getDouble(4));
                            movie.setCopies(movieInfo.getInt(5));
                            movie.setRating(movieInfo.getInt(6));
                            movie.setDate(date);
                            movie.setOrderId(rentInfo.getLong(5));
                            rentList.add(movie);
                        }
                    }
                    
                    // get the movies in wish list
                    java.sql.ResultSet wishInfo = stmt1.executeQuery("SELECT * FROM Queued WHERE AccountID = '" + accountNum + "'");
                    while(wishInfo.next()) {
                        // get the data for every movie in the result set
                        long movieId = wishInfo.getLong(2);
                        Date date = wishInfo.getDate(3);
                        java.sql.ResultSet movieInfo = stmt2.executeQuery("SELECT * FROM Movie WHERE ID = '" + wishInfo.getString(2) + "'");
                        if(movieInfo.next()) {
                            Movie movie = new Movie();
                            movie.setId(movieId);
                            movie.setTitle(movieInfo.getString(2));
                            movie.setGenre(movieInfo.getString(3));
                            movie.setFee(movieInfo.getDouble(4));
                            movie.setCopies(movieInfo.getInt(5));
                            movie.setRating(movieInfo.getInt(6));
                            //movie.setDate(date);
                            //movie.setOrderId(rentInfo.getLong(5));
                            wishList.add(movie);
                        }
                    }
                    
                    // get best-seller list
                    java.sql.ResultSet topInfo = stmt1.executeQuery("SELECT * FROM  PopularMovies");
                    while(topInfo.next()) {
                        // get the data for every movie in the result set
                        long movieId = topInfo.getLong(2);
                        //Date date = wishInfo.getDate(3);
                        java.sql.ResultSet movieInfo = stmt2.executeQuery("SELECT * FROM Movie WHERE ID = '" + topInfo.getString(2) + "'");
                        if(movieInfo.next()) {
                            Movie movie = new Movie();
                            movie.setId(movieId);
                            movie.setTitle(movieInfo.getString(2));
                            movie.setGenre(movieInfo.getString(3));
                            movie.setFee(movieInfo.getDouble(4));
                            movie.setCopies(movieInfo.getInt(5));
                            movie.setRating(movieInfo.getInt(6));
                            //movie.setDate(date);
                            //movie.setOrderId(rentInfo.getLong(5));
                            topList.add(movie);
                        }
                    }
                    */
                    
            } catch (Exception e) {
                    e.printStackTrace();

            } finally {

                    try {
                            conn.close();
                    } catch (Exception ee) {
                    }
                    ;
            }
            //customer.setFName(accountNum+" hhh");
            session.setAttribute("employeeData", employee);
            //session.setAttribute("rentList", rentList);
            //session.setAttribute("wishList", wishList);
            //session.setAttribute("topList", topList);
            RequestDispatcher view = request.getRequestDispatcher("EmployeeInformationPage.jsp");
            view.forward(request, response);
    }

}