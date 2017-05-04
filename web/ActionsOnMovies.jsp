<%-- 
    Document   : ActionsOnMovies
    Created on : May 4, 2017, 7:52:39 AM
    Author     : Weichao ZHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1> 
        <%
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";
        String mysUserID = "root"; 
        String mysPassword = "Zhao6288588@";
        
        
        java.sql.Connection conn=null;
        try {
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);

            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            
            if (request.getParameter("add_movie_button") != null) {
                // get parameters
                String movieName = request.getParameter("new_movie_name");
                String movieGenre = request.getParameter("new_movie_genre");
                Integer fee = Integer.parseInt(request.getParameter("new_movie_fee"));
                long copies = Long.parseLong(request.getParameter("new_movie_copies"));
                
               
                //java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                
                // add to customer table and person table
                java.sql.CallableStatement stmt = conn.prepareCall("{call AddMovie(?, ?, ?, ?)}");
                stmt.setString(1, movieName);
                stmt.setString(2, movieGenre);
                stmt.setInt(3, fee);
                stmt.setLong(4, copies);

                stmt.execute();
                stmt.close();
                RequestDispatcher view = request.getRequestDispatcher("EmployeeInformationPage.jsp");
                view.forward(request, response);  

            }
            else if (request.getParameter("edit_movie_button") != null)
            {
                long movieID = Long.parseLong(request.getParameter("edit_movie_id"));
                String attr = request.getParameter("edit_movie_attr");
                String new_value = request.getParameter("new_movie_value");
               
                //java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                
                // add to customer table and person table
                java.sql.CallableStatement stmt = conn.prepareCall("{call EditMovie(?, ?, ?)}");
                stmt.setLong(1, movieID);
                stmt.setString(2, attr);
                stmt.setString(3, new_value);

                stmt.execute();
                stmt.close();
               
                RequestDispatcher view = request.getRequestDispatcher("EmployeeInformationPage.jsp");
                view.forward(request, response);   
            }
            else if (request.getParameter("delete_movie_button") != null)
            {
                long movieID = Long.parseLong(request.getParameter("delete_movie_by_id"));
                //java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
         
                java.sql.CallableStatement stmt = conn.prepareCall("{call DeleteMovie(?)}");
                stmt.setLong(1, movieID);
//                stmt.setString(2, attr);
//                stmt.setString(3, new_value);

                stmt.execute();
                stmt.close();
                
                RequestDispatcher view = request.getRequestDispatcher("EmployeeInformationPage.jsp");
                view.forward(request, response);   
            }
        }
            
            catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            try{conn.close();}catch(Exception ee){};
        }
            %>
        </h1>
    </body>
</html>
