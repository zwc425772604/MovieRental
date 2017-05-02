package users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class UserAddServlet extends HttpServlet {

    public static String join(List<String> list, String delim) {

        StringBuilder sb = new StringBuilder();

	String loopDelim = "";

	for(String s : list) {

	    sb.append(loopDelim);
	    sb.append(s);            

	    loopDelim = delim;
	}

	return sb.toString();
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /* //This is testing customer message
        String FName = request.getParameter("FirstName");
        String LName = request.getParameter("LastName");
        String address = request.getParameter("Address");
        String email = request.getParameter("Email");
        String city = request.getParameter("City");
        String state = request.getParameter("State");
        String zipStr = request.getParameter("Zip");
        String phoneStr = request.getParameter("Telephone");
        

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + FName+LName+email+address+city+state+zipStr+phoneStr + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        */
        
        
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";
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

            if (request.getParameter("target").trim().equals("customer")) {
                // TODO: ID should be generated for customers
                // TODO: get customer credit card #, rating
                // TODO: generate date              
                
                // get parameters
                String FName = request.getParameter("FirstName");
                String LName = request.getParameter("LastName");
                String address = request.getParameter("Address");
                String email = request.getParameter("Email");
                String city = request.getParameter("City");
                String state = request.getParameter("State");
                String zipStr = request.getParameter("Zip");
                String phoneStr = request.getParameter("Telephone");
                String creditStr = request.getParameter("CreditCard");
                String accType = request.getParameter("status");
                
                int zip = Integer.parseInt(zipStr);
                long phone = Long.parseLong(phoneStr);
                long credit = Long.parseLong(creditStr);
                //Calendar currenttime = Calendar.getInstance();
                //java.sql.Date date = new java.sql.Date((currenttime.getTime()).getTime());
                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                
                // add to customer table and person table
                java.sql.CallableStatement stmt = conn.prepareCall("{call AddCustomer(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                stmt.setString(1, FName);
                stmt.setString(2, LName);
                stmt.setString(3, address);
                stmt.setString(4, city);
                stmt.setString(5, state);
                stmt.setInt(6, zip);
                stmt.setLong(7, phone);
                stmt.setString(8, email);
                stmt.setLong(9, credit);

                stmt.execute();
                stmt.close();

                // add to account table
                java.sql.Statement stmt1 = conn.createStatement();
                String accountStr = "";
                java.sql.ResultSet rs = stmt1.executeQuery("SELECT Customer.ID from Customer, Person WHERE Customer.ID = Person.ID AND Person.FirstName='"+ FName + "' AND Person.LastName='" + LName + "' AND Person.Address='" + address + "' AND Person.City='" + city + "' AND Person.State='" + state + "' AND Person.zip='" + zip + "'");
                if (rs.next()) {
                    accountStr = rs.getString(1);
                }
                stmt1.close();
                long account = Long.parseLong(accountStr);
                java.sql.CallableStatement stmt2 = conn.prepareCall("{call createAccount(?, ?, ?)}");
                stmt2.setLong(1, account);
                stmt2.setString(2, accType);
                stmt2.setDate(3, date);
                
                stmt2.execute();
                stmt2.close();
                
                
            } else {
                // TODO: get employee ssn, position, wage
                // TODO: generate date
                
                
                //stmt1.executeUpdate("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");
                //System.out.println("Id:		"+Id);

                // out.print("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");;
                //stmt1.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            try{conn.close();}catch(Exception ee){};
        }


        RequestDispatcher view = request.getRequestDispatcher("regSuccess.jsp");
        view.forward(request, response);    

    }
}