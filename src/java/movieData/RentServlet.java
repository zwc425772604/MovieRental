/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movieData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ZheLin
 */
public class RentServlet extends HttpServlet {
  @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			 
        ServletContext context= getServletContext();
        RequestDispatcher rd= context.getRequestDispatcher("/CustomerInfoServlet");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();  
        String rentId = request.getParameter("rentId");
        String account = request.getParameter("rentAccount");
        String type = request.getParameter("rentType");
        long accountNum = Long.parseLong(account);
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";  //cse305 is the database name
        String mysUserID = "root"; 
        String mysPassword = "1234";



        java.sql.Connection conn=null;
            
        try {              

            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);

            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            java.sql.Statement stmt1 = conn.createStatement();
            java.sql.Statement stmt2 = conn.createStatement();

            // Check if the customer can rent
            // First check if he already hold the movie            
            java.sql.ResultSet rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
            while(rentInfo.next()) {
                // get the data for every movie in the result set
                String movieId = rentInfo.getString(2);
                if(movieId.equals(rentId)) {
                    response.sendRedirect("rentFailure.jsp");
                }
            }

            // Then check account type limit
            if(type.equals("Limited")) {
                boolean canAdd = true;
                //Check currently holding number
                rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
                if(rentInfo.next()) {
                    canAdd = false;
                }
                //Check month limit
                Date date1 = new Date(Calendar.getInstance().getTimeInMillis());
                Date date2;
                Calendar cal1 = Calendar.getInstance();
                Calendar cal2 = Calendar.getInstance();
                cal1.setTime(date1);
                rentInfo = stmt1.executeQuery("SELECT OrderDate FROM RentalHistory WHERE AccountID = '" + accountNum + "'");
                while(rentInfo.next()) {
                    date2 = rentInfo.getDate(1);
                    cal2.setTime(date2);
                    boolean sameMonth = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
                    if(sameMonth) 
                        canAdd = false;
                }  
                if(!canAdd)
                    response.sendRedirect("rentFailure.jsp");
            } else if(type.equals("Unlimited")) {
                //Check currently holding number
                rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
                if(rentInfo.next()) {
                    response.sendRedirect("rentFailure.jsp");
                }
            } else if(type.equals("Unlimited+")) {
                //Check currently holding number
                int mc = 0;
                rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
                while(rentInfo.next()) {
                    mc++;
                }
                if(mc>=2)
                    response.sendRedirect("rentFailure.jsp");
            } else {
                //Check currently holding number
                int mc = 0;
                rentInfo = stmt1.executeQuery("SELECT * FROM CurrentRentals WHERE AccountID = '" + accountNum + "'");
                while(rentInfo.next()) {
                    mc++;
                }
                if(mc>=3)
                    response.sendRedirect("rentFailure.jsp");
            }
            
            
            
            // Then check if the movie still has available copies
            
            // If customer can rent, add entry in database table unconfirmed order
            
            /*String cusOrEmp = request.getParameter("group1");
            session.setAttribute("cusOrEmp", cusOrEmp);
            conn.setAutoCommit(false);
            java.sql.Statement stmt1=conn.createStatement();
            if (cusOrEmp.equals("customer")) {
                session.setAttribute("login",username);
                java.sql.ResultSet rs = stmt1.executeQuery(" SELECT * FROM Account where Id='"+username+"'");
                if(rs.next()) {
                    // login success as customer
                    ServletContext context= getServletContext();
                    RequestDispatcher rd= context.getRequestDispatcher("/CustomerInfoServlet");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("loginFailure.jsp");
                }
            } else {
                session.setAttribute("login",username);
                java.sql.ResultSet rs = stmt1.executeQuery(" SELECT * FROM Employee where SSN='"+username+"'");
                if(rs.next()) {
                    // login success as employee
                    response.sendRedirect("RegisterPage.jsp");
                } else {
                    response.sendRedirect("loginFailure.jsp");
                }
            }*/
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{conn.close();}catch(Exception ee){};
        }
    }
    
}
