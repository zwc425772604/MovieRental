package users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
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
                String cusStr = "";
                java.sql.ResultSet rs = stmt1.executeQuery("SELECT Customer.ID from Customer, Person WHERE Customer.ID = Person.ID AND Person.FirstName='"+ FName + "' AND Person.LastName='" + LName + "' AND Person.Address='" + address + "' AND Person.City='" + city + "' AND Person.State='" + state + "' AND Person.zip='" + zip + "'");
                if (rs.next()) {
                    cusStr = rs.getString(1);
                }
                stmt1.close();
                long cusID = Long.parseLong(cusStr);
                java.sql.CallableStatement stmt2 = conn.prepareCall("{call createAccount(?, ?, ?)}");
                stmt2.setLong(1, cusID);
                stmt2.setString(2, accType);
                stmt2.setDate(3, date);
                
                stmt2.execute();
                stmt2.close();
                
                // Get the account id for customer to login
                java.sql.Statement stmt3 = conn.createStatement();
                String accountStr = "";
                java.sql.ResultSet rs1 = stmt3.executeQuery("SELECT Account.ID from Account, Customer WHERE Customer.ID = Account.CustomerID AND Customer.ID='"+ cusID + "'");
                if (rs1.next()) {
                    accountStr = rs1.getString(1);
                }
                stmt3.close();
                request.setAttribute("accountNum", accountStr);
                
            } else {
                // get parameters
                String FName = request.getParameter("FirstName");
                String LName = request.getParameter("LastName");
                String address = request.getParameter("Address");
                String city = request.getParameter("City");
                String state = request.getParameter("State");
                String zipStr = request.getParameter("Zip");
                String phoneStr = request.getParameter("Telephone");
                String ssnStr = request.getParameter("SSN");
                String wageStr = request.getParameter("Wage");
                String position = request.getParameter("status");
                
                int zip = Integer.parseInt(zipStr);
                long phone = Long.parseLong(phoneStr);
                long ssn = Long.parseLong(ssnStr);
                int wage = Integer.parseInt(wageStr);
                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                
                // add to employee table and person table
                java.sql.CallableStatement stmt = conn.prepareCall("{call AddEmployee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                stmt.setString(1, position);
                stmt.setLong(2, ssn);
                stmt.setString(3, FName);
                stmt.setString(4, LName);
                stmt.setString(5, address);
                stmt.setString(6, city);
                stmt.setString(7, state);
                stmt.setInt(8, zip);
                stmt.setLong(9, phone);
                stmt.setDate(10, date);
                stmt.setInt(11, wage);

                stmt.execute();
                stmt.close();
                request.setAttribute("accountNum", ssnStr);
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