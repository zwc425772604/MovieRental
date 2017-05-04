<%-- 
    Document   : mostRentedMovies
    Created on : May 4, 2017, 10:55:49 AM
    Author     : Weichao ZHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Most Active Customer </title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>See What's the most actively rented movies<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">They are:.<br />
                        &nbsp;<br />
                    </span><br />
       

                <table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Rental Count</span></td>
                       <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie ID</span></td>
                       <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie Title</span></td>
                 
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
                    java.sql.Statement stmt2 = conn.createStatement();
                    String movie_by_type_sql = "SELECT R.TotalRentals, M.ID, M.Title FROM Movie M JOIN (SELECT COUNT(*) TotalRentals, MovieID FROM Rental GROUP BY MovieID) R ON M.ID = R.MovieID ORDER BY R.TotalRentals DESC, M.Title ASC";
                    
                    //FROM (Rental JOIN _Order ON OrderID = _Order.ID) JOIN Movie ON (MovieID = Movie.ID)
                    java.sql.ResultSet movieInfo = stmt2.executeQuery(movie_by_type_sql); 
                    while (movieInfo.next())
                        {

                            %>
                        <tr>
                            <td> <%= movieInfo.getString(1)%> </td>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
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

                
            </tr>
        </table>
                            <input id="Button1" type="button" onclick="window.open('EmployeeInfoServlet','_self');" value="Back" />
                    <input id="Button2" type="button" onclick="window.open('index.jsp','_self');" value="Logout" /><br />
                    
                    
                    <br />
                   <span style="font-size: 9pt">
            <br />
            Group Trappist-1f, 2017<br />
            Department of Computer Science, State University of New York at Stony Brook</span></strong></span><span
                style="font-size: 9pt"> </span>
               
    </strong></span>

</body>
</html>