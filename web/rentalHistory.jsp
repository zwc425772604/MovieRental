<%-- 
    Document   : rentalHistory
    Created on : May 4, 2017, 3:33:54 AM
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
        <title>Rental History</title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>Rental History<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">These are movies you rented.<br />
                        &nbsp;<br />
                    </span><br />
       

                <table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                       <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Order Id</span></td>
                        <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Order Date</span></td>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Movie Title</span></td>
                      <td style="width: 100px">
                          <span style="font-size: 10pt">
                          Genre</span></td>
                      <td style ="width:50px">
                            <span style="font-size: 10pt">
                          Rate it</span>
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
                    java.sql.ResultSet movieInfo = stmt2.executeQuery("SELECT * FROM RentalHistory WHERE AccountID = '" + customer.getAccount() +"'");        
                    while (movieInfo.next()){

                            %>
                        <tr>
                            <td> <%= movieInfo.getString(2)%> </td>
                            <td> <%= movieInfo.getString(7)%> </td>
                            <td> <%= movieInfo.getString(4)%> </td>
                            <td> <%= movieInfo.getString(5)%> </td>
                            <td>                                     
                                <form name="myForm2" action="RateServlet" method="post">
                                    <input type="hidden" name="rateId" value=<%= movieInfo.getString(4)%> >  
                                    <input type="hidden" name="rateAccount" value=${customerData.account}>
                                    <input type="text" name="ratePoint">
                                    <input id="Rate" type="submit" value="Rate" />
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
                    <input id="Button1" type="button" onclick="window.open('CustomerInfoServlet','_self');" value="Back" />
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
