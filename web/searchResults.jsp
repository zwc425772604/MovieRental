
<%@page import="java.util.ArrayList"%>
<%@page import="movieData.Movie"%>
<%-- 
    Document   : searchResults
    Created on : May 2, 2017, 10:18:52 PM
    Author     : Weichao ZHao
--%>

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
    <span style="font-size: 14pt; font-family: Arial"><strong>Searched Movies According
        to your Preference<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <span style="font-size: 10pt">These are available movies based on your preference.<br />
                        &nbsp;<br />
                    </span><br />
       

<table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                    <tr>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie Title:</span></td>
                      <td style="width: 100px">
                          <span style="font-size: 10pt">Genre</span></td>
                      <td style="width: 74px">
                            <span style="font-size: 10pt">Fee</span></td>
                      <td>
                            <span style="font-size: 10pt">Total Copies</span></td>
                      <td style="width: 7px">
                            <span style="font-size: 10pt">Rating</span></td>
                    </tr>

             
         <% 
            String mysJDBCDriver = "com.mysql.jdbc.Driver";
            String mysURL = "jdbc:mysql://127.0.0.1:3306/cse305";
            String mysUserID = "root";
            String mysPassword = "1234";
            ArrayList<Movie> movies = new ArrayList<Movie>();
             Movie mov = null;
            java.sql.Connection conn = null;
            try {
                    Class.forName(mysJDBCDriver).newInstance();
                    java.util.Properties sysprops = System.getProperties();
                    sysprops.put("user", mysUserID);
                    sysprops.put("password", mysPassword);

                    // connect to the database
                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                    // get the customer id with account id
                    if (request.getParameter("movie_type").trim() != "")
                    {  
                        //#TODO user may enter multiple keywords, so may execute the query multiple times
                        String type = request.getParameter("movie_type");         
                        java.sql.Statement stmt2 = conn.createStatement();  //query for searching by movie types
                        java.sql.ResultSet movieInfo = stmt2.executeQuery("SELECT * FROM Movie M WHERE M.TotalCopies > 0 AND M.Genre='"+type +"'"); 
                        while (movieInfo.next())
                        { %>
                        <tr>
                            <td> <%= movieInfo.getString("Title")%> </td>
                            <td> <%= movieInfo.getString("Genre")%> </td>
                            <td> <%= movieInfo.getString("Fee")%> </td>
                            <td> <%= movieInfo.getString("TotalCopies")%> </td>
                            <td> <%= movieInfo.getString("Rating")%> </td>
                        </tr>
                        <%
                        }
                    }
                    if (request.getParameter("movie_keyword").trim() != "")
                    {
                        String key = request.getParameter("movie_keyword");
                        java.sql.Statement stmt2 = conn.createStatement(); //query for searching the movie by keyword eg. movie title
                        String sql = "SELECT * FROM Movie M WHERE M.Title LIKE CONCAT('%', CONCAT('" + key + "', '%'))";
                        java.sql.ResultSet movieInfo = stmt2.executeQuery(sql);
                        while (movieInfo.next())
                        { %>
                         <tr>
                            <td> <%= movieInfo.getString("Title")%> </td>
                            <td> <%= movieInfo.getString("Genre")%> </td>
                            <td> <%= movieInfo.getString("Fee")%> </td>
                            <td> <%= movieInfo.getString("TotalCopies")%> </td>
                            <td> <%= movieInfo.getString("Rating")%> </td>
                        </tr>
                        <%
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
                    <input id="Button1" type="button" onclick="window.open('searchMovie.jsp','_self');" value="Search Again" />
                    <input id="Button2" type="button" onclick="window.open('index.jsp','_self');" value="Logout" /><br />
                    
                    
                    <br />
                    <span style="font-size: 8pt">
                        <br />
                        Shang Yang, 10/19/2006, Demo Version<br />
                        Department of Computer Science,<br />
                        SUNY at Stony Brook</span></td>
                <td style="width: 292px; height: 454px; vertical-align: top; text-align: left;">
                    <img src="Bridge.JPG" /></td>
            </tr>
        </table>
    </strong></span>

</body>
</html>