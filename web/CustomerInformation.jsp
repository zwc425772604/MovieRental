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
        <span style="font-size: 14pt; font-family: Arial"><strong>Hello, . Welcome to Trappist-1f Movie Rental.<br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <!--Currently held movies-->
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                          <td style="width: 84px">
                              <span style="font-size: 10pt">
                              Course Code</span></td>
                          <td style="width: 187px">
                              <span style="font-size: 10pt">Course Name</span></td>
                            <td style="width: 74px">
                                <span style="font-size: 10pt">Department</span></td>
                            <td>
                                <span style="font-size: 10pt">Professor</span></td>
                            <td style="width: 7px">
                                <span style="font-size: 10pt">Grade</span></td>
                            <td style="width: 7px">
                                <span style="font-size: 10pt">Oper</span></td>
                        </tr>   

                        <c:forEach items="${list2}" var="item">


                            <% String stuId = "" + session.getAttribute("login"); %>


                            <tr>
                                <td style="width: 84px">
                                    <span style="font-size: 10pt">${item.item1}</span></td>
                                <td style="width: 187px">
                                    <span style="font-size: 10pt">${item.item2}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.item3}</span></td>
                                <td>
                                    <span style="font-size: 10pt">${item.item4}</span></td>
                                <td style="width: 7px">
                                    <span style="font-size: 10pt">${item.item5}</span></td>
                                <td>
                                    <form name="myForm" action="delcourse" method="post">
                                        <input type="hidden" name="userid" value=<%=stuId%>>
                                        <input type="hidden" name="crscode" value=${item.item1} >  
                                        <input id="Button2" type="submit" value="Delete" />
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

