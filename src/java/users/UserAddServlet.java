package users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.*;
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
        
        
        String FName = request.getParameter("FirstName");
        String LName = request.getParameter("LastName");
        String address = request.getParameter("Address");
        String email = request.getParameter("Email");
        String city = request.getParameter("City");
        String state = request.getParameter("State");
        String zipStr = request.getParameter("Zip");
        String phoneStr = request.getParameter("Telephone");
        System.out.println(FName+LName+address+city+state+zipStr+phoneStr);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
            System.out.println("Connected successfully to database using JConnect");

            java.sql.Statement stmt1=conn.createStatement();
            if (request.getParameter("target").trim().equals("customer")) {
                // TODO: ID should be generated for customers
                // TODO: get customer credit card #, rating
                // TODO: generate date
                
                //stmt1.executeUpdate("insert into Student values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("status")+"')");
                //out.print("insert into Student values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("status")+"')");
                stmt1.close();
            } else {
                // TODO: get employee ssn, position, wage
                // TODO: generate date
                
                
                //stmt1.executeUpdate("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");
                //System.out.println("Id:		"+Id);

                // out.print("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");;
                stmt1.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            try{conn.close();}catch(Exception ee){};
        }

        //RequestDispatcher view = request.getRequestDispatcher("useradd.jsp");
        //view.forward(request, response);    
    }
}