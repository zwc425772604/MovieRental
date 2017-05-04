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


public class MdelE extends HttpServlet {
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
            String ssnStr = request.getParameter("delete_employee_ssn");

            // add to employee table and person table
            java.sql.CallableStatement stmt = conn.prepareCall("{CALL DeleteEmployee(?)}");
            stmt.setLong(1, Long.parseLong(ssnStr));

            stmt.execute();
            stmt.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            try{conn.close();}catch(Exception ee){};
        }


        RequestDispatcher view = request.getRequestDispatcher("EmployeeInfoServlet");
        view.forward(request, response);    

    }
}