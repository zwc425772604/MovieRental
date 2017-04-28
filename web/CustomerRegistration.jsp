<%-- 
    Document   : CustomerRegistration
    Created on : Apr 25, 2017, 11:54:46 PM
    Author     : ZheLin
    Description: This is the registration page for customer.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Registration for Customer</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
    if(document.myForm.FirstName.value == "")
        alert("Your First Name must not be null!!!")
    else if(document.myForm.LastName.value == "")
        alert("Your Last Name must not be null!!!") 
    else if(document.myForm.Email.value == "")
        alert("You Email must not be null!!!")
    else if(document.myForm.Address.value == "")
        alert("Your Address must not be null!!!")
    else if(document.myForm.City.value == "")
        alert("City must not be null!!!")
    else if(document.myForm.State.value == "")
        alert("State must not be null!!!")
    else if(document.myForm.Zip.value == "")
        alert("Zip Code must not be null!!!")
    else if(document.myForm.Telephone.value == "")
        alert("Telephone must not be null!!!")
    else if(document.myForm.CreditCard.value == "")
        alert("Credit Card Number must not be null!!!")
    else{document.myForm.submit()}
}

function Button2_onclick() {
    window.open("RegisterPage.jsp","_self");

}

// ]]>
</script>
</head>
<body style="text-align: center" bgcolor="white">

  <span><strong><span style="font-size: 14pt; font-family: Arial">
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 14pt; width: 100%;
        height: 100%" id="TABLE1">
        <tr>
            <td colspan="2" style="height: 63px; text-align: center; background-color: white;">
                Customer Registration</td>
        </tr>
        <tr>
        	<form name="myForm" action="UserAddServlet" method="post">
        		<input type="hidden" name="target" value="customer">
            <td style="width: 220px; height: 426px; background-color: white; vertical-align: top; text-align: left;">
                <span style="font-size: 10pt"><strong>First Name: &nbsp; &nbsp;<br />
                    </strong></span>
                <input name="FirstName" style="font-weight: bold; font-size: 10pt; width: 145px; left: 1px; position: relative; top: 0px;" type="text" />
                    
                <span style="font-size: 10pt"><strong><br />Last Name:<br />
                <input name="LastName" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" />
                    
                <br/>
                <span style="font-size: 10pt"><strong>Email:<br />
                <input name="Email" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                    
                <span style="font-size: 10pt"><strong>Address:<br />
                <input name="Address" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
                <span style="font-size: 10pt"><strong>City:<br />
                <input name="City" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
                <span style="font-size: 10pt"><strong>State:<br />
                <input name="State" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
                <span style="font-size: 10pt"><strong>Zip Code:<br />
                <input name="Zip" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
                <span style="font-size: 10pt"><strong>Telephone:<br />
                <input name="Telephone" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
                <span style="font-size: 10pt"><strong>Credit Card Number:<br />
                <input name="CreditCard" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                    
                    Select Your Plan Here:<br />
                    <input id="Radio1" checked="checked" name="status" type="radio" value="LIMITED"/>&nbsp; LIMITED<br />
                    <input id="Radio2" name="status" type="radio"  value="UNLIMITED1"/>&nbsp; UNLIMITED1&nbsp;<br/>
                    <input id="Radio3" name="status" type="radio"  value="UNLIMITED2"/>&nbsp; UNLIMITED2&nbsp;<br />
                    <input id="Radio4" name="status" type="radio"  value="UNLIMITED3"/>&nbsp; UNLIMITED3<br />
                    <br />

                    <input type="button" value="Finish!" onclick="Button1_onclick()">
                    
                    
                    </form>
                    
                    <form>
                    
                    <input id="Button3" type="button" value="Cancel"  onclick="Button2_onclick()" /><br />
                    <span style="font-size: 8pt; font-family: Arial">
                        <br />
                        <br />
                        Group Trappist-1f, 2017<br />
                        Department of Computer Science,<br />
                        SUNY at Stony Brook</span>
                </strong></span>
            </td>
            <td style="vertical-align: top; background-color: white; text-align: justify; width: 355px; height: 426px;">
            <img style="max-height:200px" src="img/MainPage.jpg" /></td>
           </form>
        </tr>
        <tr>
            <td style="width: 220px; background-color: white;">
            </td>
            <td style="vertical-align: top; background-color: white; text-align: justify; width: 355px;">
            </td>
        </tr>
    </table>
</span></strong>

</body>
</html>