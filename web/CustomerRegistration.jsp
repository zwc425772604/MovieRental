<%-- 
    Document   : CustomerRegistration
    Created on : Apr 25, 2017, 11:54:46 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Registration for Customer</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
if(document.myForm.id.value == "")
		alert("Your ID must not be null!!!")
else if(document.myForm.name.value == "")
		alert("Your Name must not be null!!!")
else if(document.myForm.Password1.value == "")
		alert("Your Password must not be null!!!")
else if(document.myForm.Password1.value != document.myForm.Password2.value)
    alert("The Two Passwords Should Be the SAME!!!")
    
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
        	<form name="myForm" action="useradd" method="post">
        		<input type="hidden" name="target" value="customer">
            <td style="width: 220px; height: 426px; background-color: white; vertical-align: top; text-align: left;">
                <span style="font-size: 10pt"><strong>Your ID: &nbsp; &nbsp;<br />
                </strong></span><input name="Id" style="font-weight: bold; font-size: 10pt; width: 145px; left: 1px; position: relative; top: 0px;" type="text" /><span
                    style="font-size: 10pt"><strong>
                        <br />
                        Password:&nbsp;<br />
                    </strong></span><input
                            name="Password1" style="font-weight: bold; font-size: 10pt; width: 145px; left: 0px; position: relative; top: 0px;" type="password" /><br />
                <span style="font-size: 10pt"></span><span style="font-size: 10pt"><strong>Re-enter Password:<br />
                </strong></span><input id="Password2" style="font-weight: bold; font-size: 10pt;
                        width: 145px" type="password" /><br />
                <span style="font-size: 10pt"><strong>Your Name:<br />
                    <input name="Name" style="font-weight: bold; font-size: 10pt; width: 145px"
                        type="text" /><br />
                    email Address:<br />
                    <input id="Text3" style="width: 145px" type="text" /><br />
                    <br />
                    Select Your Plan Here:<br />
                    <input id="Radio1" checked="checked" name="status" type="radio" value="LIMITED"/>&nbsp; LIMITED<br />
                    <input id="Radio2" name="status" type="radio"  value="UNLIMITED1"/>&nbsp; UNLIMITED1&nbsp;<br/>
                    <input id="Radio3" name="status" type="radio"  value="UNLIMITED2"/>&nbsp; UNLIMITED2&nbsp;<br />
                    <input id="Radio4" name="status" type="radio"  value="UNLIMITED3"/>&nbsp; UNLIMITED3<br />
                    <br />
                    Your Address: &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <br />
                    <textarea id="TextArea1" style="width: 200px; height: 96px"></textarea><br />
                    
                    <input type="submit" value="Finish!">
                    
                    
                    </form>
                    
                    <form>
                    
                    <input id="Button3" type="button" value="Cancel"  onclick="window.open('','_self');" /><br />
                    <span style="font-size: 8pt; font-family: Arial">
                        <br />
                        <br />
                        Group Trappist-1f, 2017<br />
                        Department of Computer Science,<br />
                        SUNY at Stony Brook</span>
                </strong></span>
            </td>
            <td style="vertical-align: top; background-color: white; text-align: justify; width: 355px; height: 426px;">
                <img src="WangCenter.JPG" /></td>
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