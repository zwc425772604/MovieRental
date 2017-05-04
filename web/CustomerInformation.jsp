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
        <script>
            function displaySearchBox()
            {
               var a = document.getElementsByClassName("search_course")[0];
               a.style.display = "inline";
            }
            function test(i, j) {
                alert(i + "," + j);
            }
            
        </script>
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
                            <span style="font-size: 10pt">Operations</span></td>
                        </tr>   

                        <c:forEach items="${rentList}" var="item">
                            <tr>
                                <td style="width: 187px">
                                    <span style="font-size: 10pt">${item.title}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.genre}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.date}</span></td>
                                <td>
                                    <form name="myForm1" action="ReturnServlet" method="post">
                                        <input type="hidden" name="orderId" value=${item.orderId} >  
                                        <input id="ReturnRent" type="submit" value="Return" />
                                    </form>                        
                                </td>
                            </tr>      
                        </c:forEach>
                    </table>               
                </td>
                <!--show wish list-->
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <p>Your wish List</p>
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                            <td style="width: 187px; text-align: center">
                              <span style="font-size: 10pt">Movie Title</span></td>
                            <td style="width: 74px; text-align: center">
                                <span style="font-size: 10pt">Genre</span></td>
                            <td style="width: 15px;text-align: center">
                            <span style="font-size: 10pt">Operations</span></td>
                        </tr>   

                        <c:forEach items="${wishList}" var="item">
                            <tr>
                                <td style="width: 187px">
                                    <span style="font-size: 10pt">${item.title}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.genre}</span></td>
                                <td>
                                    <form name="myForm2" action="RentServlet" method="post">
                                        <input type="hidden" name="rentId" value=${item.id} >  
                                        <input type="hidden" name="rentAccount" value=${customerData.account}>
                                        <input type="hidden" name="rentType" value=${customerData.type}>
                                        <input id="Rent" type="submit" value="Rent" />
                                    </form>  
                                    <form name="myForm3" action="RemoveWishServlet" method="post">
                                        <input type="hidden" name="removeWishId" value=${item.id} > 
                                        <input type="hidden" name="removeWishAccount" value=${customerData.account} > 
                                        <input id="Remove" type="submit" value="Remove" />
                                    </form>    
                                </td>
                            </tr>      
                        </c:forEach>
                    </table>                     
                </td>
                <!--show top list-->
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <p>Best-Seller List</p>
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                            <td style="width: 187px; text-align: center">
                              <span style="font-size: 10pt">Movie Title</span></td>
                            <td style="width: 74px; text-align: center">
                                <span style="font-size: 10pt">Genre</span></td>
                            <td style="width: 15px;text-align: center">
                            <span style="font-size: 10pt">Operations</span></td>
                        </tr>   

                        <c:forEach items="${topList}" var="item">
                            <tr>
                                <td style="width: 187px">
                                    <span style="font-size: 10pt">${item.title}</span></td>
                                <td style="width: 74px">
                                    <span style="font-size: 10pt">${item.genre}</span></td>
                                <td>
                                    <form name="myForm4" action="AddWishServlet" method="post">
                                        <input type="hidden" name="wishId" value=${item.id} >
                                        <input type="hidden" name="wishAccount" value=${customerData.account}>
                                        <input id="AddWish" type="submit" value="Add to Wish"/>
                                    </form>
                                    <form name="myForm5" action="RentServlet" method="post">
                                        <input type="hidden" name="rentId" value=${item.id} >  
                                        <input type="hidden" name="rentAccount" value=${customerData.account}>
                                        <input type="hidden" name="rentType" value=${customerData.type}>
                                        <input id="Rent" type="submit" value="Rent" />
                                    </form>    
                                </td>
                            </tr>      
                        </c:forEach>
                    </table>                     
                </td>
                
                
            </tr>
        </table>
    
        <input id="Button1" type="button" value="Search Movie" onclick="window.open('searchMovie.jsp','_self');" />
        <input id="Button2" type="button" value="Account Settings" onclick="window.open('customerAccount.jsp', '_self')"/> 
        <input id="Button3" type="button" value="Recomendation List" onclick=""/> 
        <input id="Button4" type="button" value="Rental History" onclick=""/>          
        
        <input id="Button5" type="button" value="Logout" onclick="window.open('index.jsp','_self');" /><br />
        <div class = "search_course" id ="search_box" style="display:none">
            <label> Search by keyword: </label>
            <input type ="text" id ="keyword"/>
        </div>
        <span style="font-size: 8pt">
        <br />
        Group Trappist-1f, 2017<br />
        Department of Computer Science,<br />
        SUNY at Stony Brook</span>
    </strong></span>

</body>
</html>

