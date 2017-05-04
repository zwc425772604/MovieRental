/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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


public class MaddE extends HttpServlet {
    @Override
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

          
            // get parameters
            String FName = request.getParameter("FirstName1");
            String LName = request.getParameter("LastName1");
            String address = request.getParameter("Address1");
            String city = request.getParameter("City1");
            String state = request.getParameter("State1");
            String zipStr = request.getParameter("Zip1");
            String phoneStr = request.getParameter("Telephone1");
            String ssnStr = request.getParameter("SSN1");
            String wageStr = request.getParameter("Wage1");
            String position = request.getParameter("status1");

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