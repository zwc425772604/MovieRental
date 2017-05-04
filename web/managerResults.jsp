<%-- 
    Document   : managerResults
    Created on : May 4, 2017, 8:54:33 AM
    Author     : ZheLin
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="movieData.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>Searched Rentals According
        to your Preference<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">These are rentals based on your preference.<br />
                        &nbsp;<br />
                    </span><br />
       

<table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                        <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie ID:</span></td>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie Title:</span></td>
                      <td style="width: 100px">
                          <span style="font-size: 10pt">
                          Genre</span></td>
                      <td>
                            <span style="font-size: 10pt">
                                Order Id</span></td>
                      <td style="width: 50px">
                             <span style="font-size: 10pt">
                          Customer FirstName</span></td>
                       <td style="width: 50px">
                             <span style="font-size: 10pt">
                          Customer LastName</span></td>
                    </tr>

             
         <% 
            String mysJDBCDriver = "com.mysql.jdbc.Driver";
            String mysURL = "jdbc:mysql://127.0.0.1:3306/cse305";
            String mysUserID = "root";
            String mysPassword = "1234";
            java.sql.Connection conn = null;
            try {
                    Class.forName(mysJDBCDriver).newInstance();
                    java.util.Properties sysprops = System.getProperties();
                    sysprops.put("user", mysUserID);
                    sysprops.put("password", mysPassword);

                    // connect to the database
                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                    // get the customer id with account id
                    java.sql.Statement stmt2 = conn.createStatement();
                    String movie_by_type_sql = "SELECT RentalHistory.MovieID, RentalHistory.Title, RentalHistory.Genre, RentalHistory.OrderID, Person.FirstName, Person.LastName FROM RentalHistory, Account, Person WHERE RentalHistory.AccountID = Account.ID AND Account.CustomerID=Person.ID";
                    
                    //FROM (Rental JOIN _Order ON OrderID = _Order.ID) JOIN Movie ON (MovieID = Movie.ID)
                    java.sql.ResultSet movieInfo = stmt2.executeQuery(movie_by_type_sql); 
                    if (request.getParameter("movie_type").trim() != "")
                    {  
        
                        //#TODO user may enter multiple keywords, so may execute the query multiple times
                        String type = request.getParameter("movie_type");         
                        //java.sql.Statement stmt2 = conn.createStatement();
                        //query for searching by movie types
                        //String movie_by_type_sql = "SELECT * FROM Movie M WHERE M.TotalCopies > 0 AND M.Genre='"+type +"'";
                        //String movie_by_type_sql = "SELECT R.MovieID, M.Title, M.TotalCopies, COUNT(*), M.TotalCopies - COUNT(*) FROM (_Order O JOIN Rental R ON O.ID = R.OrderID) JOIN Movie M ON R.MovieID = M.ID WHERE O.ReturnDate IS NULL AND M.Genre = '" + type + "' GROUP BY R.MovieID";
//                        String movie_by_type_sql = "SELECT * FROM MoviesWithAllCopiesAvailable AS List1 UNION SELECT * FROM MoviesWithSomeAvailableCopies AS List2";
//                        java.sql.ResultSet movieInfo = stmt2.executeQuery(movie_by_type_sql); 
                       while (movieInfo.next())
                        {
                            if (movieInfo.getString(3).equals(type))
                            {
                            %>
                        <tr>
                            <td> <%= movieInfo.getString(1)%> </td>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
                            <td> <%= movieInfo.getString(4)%> </td>
                            <td> <%= movieInfo.getString(5)%> </td>
                            <td> <%= movieInfo.getString(6)%> </td>
   
                        </tr>
                        <%
                        }
                        }
                    }
                    if (request.getParameter("movie_keyword").trim() != "")
                    {
  
                        String key = request.getParameter("movie_keyword");
                       // java.sql.Statement stmt2 = conn.createStatement(); //query for searching the movie by keyword eg. movie title
                     //   String sql = "SELECT * FROM Movie M WHERE M.Title LIKE CONCAT('%', CONCAT('" + key + "', '%'))";
                     //   java.sql.ResultSet movieInfo = stmt2.executeQuery(sql);
                        while (movieInfo.next())
                        { 
                            if (movieInfo.getString(2).contains(key))
                            {
                            %>
                         <tr>
                            <td> <%= movieInfo.getString(1)%> </td>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
                            <td> <%= movieInfo.getString(4)%> </td>
                            <td> <%= movieInfo.getString(5)%> </td>
                            <td> <%= movieInfo.getString(6) %></td>
                        </tr>
                        <%
                        }
                        }
                    }
                    if (request.getParameter("movie_casted_actor").trim() != "")
                    {
                     
                       String cus_name = request.getParameter("movie_casted_actor");
                                                                                                                                                                                                                                                                               
                       
                          
                            while(movieInfo.next())
                            {
                               
                               if ((movieInfo.getString(5)+" " +movieInfo.getString(6)).contains(cus_name))
                            {
                            %>
                         <tr>
                            <td> <%= movieInfo.getString(1)%> </td>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
                            <td> <%= movieInfo.getString(4)%> </td>
                            <td> <%= movieInfo.getString(5)%> </td>
                            <td> <%= movieInfo.getString(6) %></td>
                        </tr>
                        <%
                        }
                        }   
                    }
                  
                  


            } catch (Exception e) {
                    e.printStackTrace();

            } finally {

                    try {
                            conn.close();
                    } catch (Exception ee) {
                    }
                    ;
            }
            
        %>
            

                    
 
                   </table> 
                    <br />
                    
                    <br />
                    
                    <!--<input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" /> -->
                    <input id="Button1" type="button" onclick="window.open('managerSearch.jsp','_self');" value="Search Again" />
                    <input id="Button2" type="button" onclick="window.open('index.jsp','_self');" value="Logout" /><br />
                    
                    
                    <br />
                   <span style="font-size: 9pt">
            <br />
            Group Trappist-1f, 2017<br />
            Department of Computer Science, State University of New York at Stony Brook</span></strong></span><span
                style="font-size: 9pt"> </span>
               
                
            </tr>
        </table>
    </strong></span>

</body>
</html>