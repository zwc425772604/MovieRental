<%-- 
    Document   : RegisterPage
    Created on : Apr 25, 2017, 11:36:38 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Registration Page</title>
    <script language="javascript" type="text/javascript">
        function Button1_onclick() {
        if(document.form1.Radio1.checked)
           window.open("CustomerRegistration.jsp","_self");
        else
           window.open("EmployeeRegistration.jsp","_self");
        }
    </script>
</head>
<body style="text-align: center" bgcolor="white">
    <span><strong><span style="font-size: 14pt; font-family: Arial">User Registration</span><br />
        <span style="font-size: 10pt; font-family: Arial">
            <br />
            First, &nbsp;please select whether
            you are a Customer or Faculty &nbsp;&nbsp; &nbsp;&nbsp;
        </span></strong></span>
    <form name = "form1">
    <input id="Radio1" name="group1" checked="checked" type="radio" /><strong><span style="font-size: 10pt;
        font-family: Arial">Customer  &nbsp; &nbsp;<input id="Radio2" name="group1" type="radio" />FACULTY
        &nbsp;
        &nbsp; &nbsp;&nbsp;
        
        <input id="Button1" style="width: 60px" onclick="Button1_onclick()" type="button" value="Next-->" />
        &nbsp;
        <input id="Button2" style="width: 60px" onclick="javascript:history.back()" type="button" value="Cancel" /></span></strong>
  		  </form> 		  
    <img style="max-height:200px" src="img/MainPage.jpg" /><br />
    <br />
    <span style="font-size: 9pt">
    <strong><span style="font-family: Arial">Group Trappist-1f, 2017<br />
        Department of Computer Science, State University of New York at Stony Brook</span></strong>
    </span>
    

</body>
</html>

