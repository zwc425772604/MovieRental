
<%-- 
    Document   : searchResults
    Created on : May 2, 2017, 10:18:52 PM
    Author     : Weichao ZHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
    </head>
   <body style="text-align: center" bgcolor="#ffff00">
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



 <c:forEach items="${list}" var="item">
 
 	
      <% String stuId = "" + session.getValue("login"); %>
     
        
        <tr>
                      <td style="width: 84px">
                          <span style="font-size: 10pt">${item.crscode}</span></td>
                      <td style="width: 187px">
                          <span style="font-size: 10pt"><c:out value="${item.crsname}" /></span></td>
                        <td style="width: 74px">
                            <span style="font-size: 10pt">${item.deptid}</span></td>
                        <td>
                            <span style="font-size: 10pt"><c:out value="${item.name}" /></span></td>
                       
                        	 <td>
                        	 
                        	 
                        	 <form action="selected" method="post">
                        	  <input type="hidden" name="userid" value=<%=stuId%>>
  							  <input type="hidden" name="crscode" value=${item.crscode} >  
                        	 <input id="Button2" type="submit" value="Submit" />
							</form>


         
                        </td>	
                    </tr>
        
        
        
        
    </c:forEach>
                   </table> 
                    <br />
                    
                    <br />
                    
                    <!--<input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" /> -->
                    <input id="Button1" type="button" onclick="window.open('searchMovie.jsp','_self');" value="<--Prev" />
                    <input id="Button2" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />
                    
                    
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