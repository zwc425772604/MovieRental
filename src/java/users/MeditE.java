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


public class MeditE extends HttpServlet {
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
            String ssnStr = request.getParameter("edit_employee_ssn");
            String attr = request.getParameter("edit_employee_attr");
            String val = request.getParameter("edit_employee_new_value");


            // add to employee table and person table
            java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditEmployee(?, ?, ?)}");
            stmt.setLong(1, Long.parseLong(ssnStr));
            stmt.setString(2, attr);
            stmt.setString(3, "\'"+val+"\'");

            stmt.execute();
            stmt.close();
            request.setAttribute("accountNum", ssnStr);

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