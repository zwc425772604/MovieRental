<%-- 
    Document   : customerMail
    Created on : May 4, 2017, 10:16:19 AM
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
        <title>All Customers' Emails</title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>List of Customers' Emails<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">These are all the emails.<br />
                        &nbsp;<br />
                    </span><br />
       

<table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                        <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Customer ID:</span></td>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          First Name:</span></td>
                      <td style="width: 100px">
                          <span style="font-size: 10pt">
                          Last Name</span></td>
                      <td style="width: 74px">
                            <span style="font-size: 10pt">
                          Email</span></td>
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
                    String movie_by_type_sql = "SELECT Customer.ID, Person.FirstName, Person.LastName, Customer.Email FROM Customer, Person WHERE Person.ID=Customer.ID";
                    java.sql.ResultSet movieInfo = stmt2.executeQuery(movie_by_type_sql); 
 
                        //#TODO user may enter multiple keywords, so may execute the query multiple times         
                        //java.sql.Statement stmt2 = conn.createStatement();
                        //query for searching by movie types
                        //String movie_by_type_sql = "SELECT * FROM Movie M WHERE M.TotalCopies > 0 AND M.Genre='"+type +"'";
                        //String movie_by_type_sql = "SELECT R.MovieID, M.Title, M.TotalCopies, COUNT(*), M.TotalCopies - COUNT(*) FROM (_Order O JOIN Rental R ON O.ID = R.OrderID) JOIN Movie M ON R.MovieID = M.ID WHERE O.ReturnDate IS NULL AND M.Genre = '" + type + "' GROUP BY R.MovieID";
//                        String movie_by_type_sql = "SELECT * FROM MoviesWithAllCopiesAvailable AS List1 UNION SELECT * FROM MoviesWithSomeAvailableCopies AS List2";
//                        java.sql.ResultSet movieInfo = stmt2.executeQuery(movie_by_type_sql); 
                       while (movieInfo.next())
                        {

                            %>
                        <tr>
                            <td> <%= movieInfo.getString(1)%> </td>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
                            <td> <%= movieInfo.getString(4)%> </td>
                        </tr>
                        <%
                        
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
                    <input id="Button1" type="button" onclick="window.open('EmployeeInfoServlet','_self');" value="Back" />
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
