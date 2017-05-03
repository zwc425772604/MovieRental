<%-- 
    Document   : CustomerInformation
    Created on : May 2, 2017, 4:48:54 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trappist1-f Movie Rental</title>

    </head>
    <body style="text-align: center" bgcolor="White">
        <img style="max-height:200px; width:100%" src="img/homepage.jpg" /><br />
        <span style="font-size: 14pt; font-family: Arial"><strong>Hello, ${customerData.FName} ${customerData.LName}. Welcome to Trappist-1f Movie Rental.<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <!--Currently held movies-->
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <p>Movies you're holding</p>
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                            <td style="width: 187px; text-align: center">
                              <span style="font-size: 10pt">Movie Title</span></td>
                            <td style="width: 74px; text-align: center">
                                <span style="font-size: 10pt">Genre</span></td>
                            <td style="width: 74px; text-align: center">
                                <span style="font-size: 10pt">Order Date</span></td>
                            <td style="width: 15px;text-align: center">
                            <span style="font-size: 10pt">Operation</span></td>
                        </tr>   

                        <c:forEach items="${rentList}" var="item">
                            <tr>
                                <td style="width: 187px">
                                    <span style="font-size: 10pt">${item.title}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.genre}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${customerData.date}</span></td>
                                <td>
                                    <form name="myForm" action="delcourse" method="post">
                                        <input id="ReturnRent" type="submit" value="Return" />
                                    </form>                        
                                </td>
                            </tr>      
                        </c:forEach>
                    </table>               
                </td>
                <!--show wish list-->
                <td>
                    
                </td>
                <!--show recommendation-->
                <td>
                    
                    
                </td>
                
                
            </tr>
        </table>
        <input id="Button1" type="button" value="Search Course" onclick="window.open('SearchCourse.htm','_self');" />
        <input id="Button1" type="button" value="Logout" onclick="window.open('index.htm','_self');" /><br />
        <span style="font-size: 8pt">
        <br />
        Group Trappist-1f, 2017<br />
        Department of Computer Science,<br />
        SUNY at Stony Brook</span>
    </strong></span>

</body>
</html>

