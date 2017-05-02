/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if((request.getParameter("action")!=null)&&(request.getParameter("action").trim().equals("logout"))){
           HttpSession session=request.getSession();  
           session.setAttribute("login","");
           response.sendRedirect("index.jsp");
           return;
        }
        String username = request.getParameter("username");
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";  //cse305 is the database name
        String mysUserID = "root"; 
        String mysPassword = "1234";

        HttpSession session=request.getSession();  
        session.putValue("login","");
        // username is not provided
        if ((username!=null)) {
            if (username.trim().equals("")){
                response.sendRedirect("index.jsp");
        }else {
            java.sql.Connection conn=null;
            
            try {              
                
                Class.forName(mysJDBCDriver).newInstance();
                java.util.Properties sysprops=System.getProperties();
                sysprops.put("user",mysUserID);
                sysprops.put("password",mysPassword);

                //connect to the database
                conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
                
                String cusOrEmp = request.getParameter("group1");
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

                    /*ServletContext context= getServletContext();
                    RequestDispatcher rd= context.getRequestDispatcher("registerPage.jsp");
                    rd.forward(request, response);*/
                } else {
                    session.setAttribute("login",username);
                    java.sql.ResultSet rs = stmt1.executeQuery(" SELECT * FROM Employee where SSN='"+username+"'");
                    if(rs.next()) {
                        // login success as employee
                        response.sendRedirect("RegisterPage.jsp");
                    } else {
                        response.sendRedirect("loginFailure.jsp");
                    }
                    
                    /*rs = stmt1.executeQuery(" select * from Employee where SSN='"+username+"'");

                    if(rs.next()) {
                        // login as employee
                        session.putValue("login", username);
                        response.sendRedirect("FacultyInformation.jsp");
                    } else {
                        // username or password mistake
                        response.sendRedirect("passMistake.jsp");
                    }*/
                    
                }
            } catch(Exception e){
                e.printStackTrace();
            } finally{
                try{conn.close();}catch(Exception ee){};
            }
        }
}




















    }

}
