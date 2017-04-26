<%-- 
    Document   : index
    Created on : Apr 25, 2017, 11:13:17 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Trappist1f Login</title>
    <script language="javascript" type="text/javascript">
        function Button1_onclick() {
        if(document.myForm.username.value == "")
            alert("UserName Can Not Be Null!")
        javascript:myForm.submit()
        }

        function Button2_onclick() {
            window.open("RegisterPage.jsp","_self");

        }    
    </script>
</head>
<body style="font-size: 12pt; text-align: center" bgcolor="white">
    <span style="font-family: Arial"><strong><span style="font-size: 14pt">Trappist-1f Video Rental</span><br />
        <br />
        <img style="max-height:200px" src="img/MainPage.jpg" /><br />
        <br />
        
        <form name="myForm" action="login" method="post">

        <span style="font-size: 10pt">User ID :</span>
        <input id="Text1" name="username" type="text" />
        &nbsp; <span style="font-size: 10pt">Password:</span>
        <input id="Password1" name="userpasswd" type="password" />
        &nbsp;
        <input id="Button1" style="width: 70px" type="button" value="Log In" onclick="return Button1_onclick()" />
        &nbsp;
        <input id="Button2" style="width: 70px" type="button" value="Register" onclick="return Button2_onclick()" /><br />
        <br />
        </form>
        
        <span style="font-size: 9pt">
            <br />
            Group Trappist-1f, 2017<br />
            Department of Computer Science, State University of New York at Stony Brook</span></strong></span><span
                style="font-size: 9pt"> </span>

</body>
</html>
