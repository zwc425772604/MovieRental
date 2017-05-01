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
           session.putValue("login","");
           response.sendRedirect("/");
           return;
        }
        String username = request.getParameter("username");
        String userpasswd = request.getParameter("userpasswd");
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/sys";  // sys is the database name
        String mysUserID = "root"; 
        String mysPassword = "1234";

        HttpSession session=request.getSession();  
        session.putValue("login","");
        // username is not provided
        if ((username!=null) &&(userpasswd!=null)) {
            if (username.trim().equals("") || userpasswd.trim().equals("")){
                response.sendRedirect("index.jsp");
        }else {
            java.sql.Connection conn=null;
            try {
               
                Class.forName(mysJDBCDriver).newInstance();
                java.util.Properties sysprops=System.getProperties();
                sysprops.put("user",mysUserID);
                sysprops.put("password",mysPassword);

                //response.sendRedirect("RegisterPage.jsp");
                //connect to the database
                conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
                //test connect
                if(conn!= null)
                    response.sendRedirect("RegisterPage.jsp");
                //test connect

                conn.setAutoCommit(false);
                java.sql.Statement stmt1=conn.createStatement();
                java.sql.ResultSet rs = stmt1.executeQuery(" select * from Account where ID='"+username+"'");
                if (rs.next()) {
                    // login success as student
                    session.putValue("login",username);
                    //response.sendRedirect("studentinfo");
                    //response.sendRedirect("/StudentInfoServlet");

                    System.out.println("RequestDispatcher rd= context.getRequestDispatcher;");

                    ServletContext context= getServletContext();
                    RequestDispatcher rd= context.getRequestDispatcher("/studentinfo");
                    rd.forward(request, response);
                } else {
                    rs = stmt1.executeQuery(" select * from Employee where SSN='"+username+"'");

                    if(rs.next()) {
                        // login as employee
                        session.putValue("login", username);
                        response.sendRedirect("FacultyInformation.jsp");
                    } else {
                        // username or password mistake
                        response.sendRedirect("passMistake.jsp");
                    }
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
