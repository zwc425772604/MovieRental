/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movieData;

import users.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class AddWishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			 
        ServletContext context= getServletContext();
        RequestDispatcher rd= context.getRequestDispatcher("/CustomerInfoServlet");
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session=request.getSession();  
	          
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";
        String mysUserID = "root"; 
        String mysPassword = "1234";
        
        //go to database
        java.sql.Connection conn=null;
        try {
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);

            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);

            java.sql.Statement stmt = conn.createStatement();
            String wishId = request.getParameter("wishId");
            String wishAccount = request.getParameter("wishAccount");
            stmt.executeUpdate("INSERT INTO Queued(AccountID, MovieID, DateAdded)" + " VALUES(" + wishAccount + "," + wishAccount + ", NULL )" );
            stmt.close();
        } catch(Exception e)
        {
                e.printStackTrace();

        }
        finally{

                try{conn.close();}catch(Exception ee){};
        }
        RequestDispatcher view = request.getRequestDispatcher("/CustomerInfoServlet");
        view.forward(request, response);    
    }

}
