<%-- 
    Document   : salesReport
    Created on : May 4, 2017, 8:20:08 AM
    Author     : ZheLin
--%>
<%@page import="java.util.Calendar"%>


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
        <title>Sales Report</title>
    </head>
   <body style="text-align: center" bgcolor="aliceblue">
    <span style="font-size: 14pt; font-family: Arial"><strong>Sales Report This Month<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: center; height: 454px;">
                    <span style="font-size: 10pt">The overall income from all active subscriptions this month.<br />
                        &nbsp;<br />
                    </span><br />
       

                <table align="center" border="8" id="TABLE1" onclick="return TABLE1_onclick()">
  
                    <tr>
                      <td style="width: 150px">
                          <span style="font-size: 10pt">
                          Total</span></td>
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
                    java.sql.CallableStatement stmt = conn.prepareCall("{CALL ViewSales(?, ?)}");
                    java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
                    stmt.setDate(1, date);
                    stmt.registerOutParameter(2, java.sql.Types.VARCHAR);

                    // execute getDBUSERByUserId store procedure
                    stmt.executeUpdate();

                    String money = stmt.getString(2);


                            %>
                        <tr>
                            <td> <%= money %> </td>
  
                        </tr>
                        <%
                        
                    
                    
                  

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
