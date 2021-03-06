<%-- 
    Document   : recommendation
    Created on : May 4, 2017, 3:33:44 AM
    Author     : ZheLin
--%>

<%@page import="users.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="movieData.Movie"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recommendation</title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>Recommendation<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">These are movies recommended.<br />
                        &nbsp;<br />
                    </span><br />
       

                <table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie Title</span></td>
                      <td style="width: 100px">
                          <span style="font-size: 10pt">
                          Genre</span></td>
                        <td style ="width:50px">
                            <span style="font-size: 10pt">
                          Rent?</span>
                      </td>
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

                    HttpSession sessionjdbc = request.getSession();
                    Customer customer = (Customer) sessionjdbc.getAttribute("customerData");
                    // connect to the database
                    conn = java.sql.DriverManager.getConnection(mysURL, sysprops);
                    // get the customer id with account id
                    java.sql.Statement stmt2 = conn.createStatement();
                    String query1 = "SELECT M.ID, M.Title, M.Genre FROM Movie M ";
                    String query2 = "WHERE M.Genre IN (SELECT O.Genre FROM RentalHistory O WHERE O.AccountID = '"+ customer.getAccount() + "') AND ";
                    String query3 = "M.ID NOT IN (SELECT O.MovieID FROM RentalHistory O WHERE O.AccountID = '"+ customer.getAccount() + "')";

                    java.sql.ResultSet movieInfo = stmt2.executeQuery(query1+query2+query3);        
                    while (movieInfo.next()){

                            %>
                        <tr>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(3)%> </td>
                            <td>                                     
                                <form name="myForm2" action="RentServlet" method="post">
                                    <input type="hidden" name="rentId" value=<%= movieInfo.getString(1)%> >  
                                    <input type="hidden" name="rentAccount" value=${customerData.account}>
                                    <input type="hidden" name="rentType" value=${customerData.type}>
                                    <input id="Rent" type="submit" value="Yes" />
                                </form>  
                            </td>
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
                            <input id="Button1" type="button" onclick="window.open('CustomerInfoServlet','_self');" value="Back" />
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
