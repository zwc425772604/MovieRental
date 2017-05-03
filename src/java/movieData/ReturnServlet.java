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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ZheLin
 */
public class ReturnServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        System.out.println("!!!!!!!!!!");
        HttpSession session=request.getSession();  
	
        String cusId = ""+session.getAttribute("login");
	          
	int returnIndex = Integer.parseInt(request.getParameter("returnindex"));
        ArrayList<Movie> rentList = (ArrayList<Movie>) session.getAttribute("rentList");
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";
        String mysUserID = "root"; 
        String mysPassword = "1234";
        
        // First delete it in the list
        Movie movie = rentList.remove(returnIndex);
        
        // then go to database
        java.sql.Connection conn=null;
        try {
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);

            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);

            java.sql.CallableStatement stmt = conn.prepareCall("{call SetReturned(?)}");
            stmt.setLong(1, movie.getOrderId());
            stmt.execute();
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
