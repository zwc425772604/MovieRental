<%-- 
    Document   : EmployeeRegistration
    Created on : Apr 27, 2017, 10:54:37 PM
    Author     : ZheLin
    Description: This is the registration page for employee.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Registration for Employee</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
    if(document.myForm.FirstName.value == "")
        alert("Your First Name must not be null!!!")
    else if(document.myForm.LastName.value == "")
        alert("Your Last Name must not be null!!!")
    else if(document.myForm.Wage.value == "")
        alert("Your Hourly Rate must not be null!!!")
    else if(document.myForm.SSN.value == "")
        alert("You SSN must not be null!!!")
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
                Employee Registration</td>
        </tr>
        <tr>
        	<form name="myForm" action="useradd" method="post">
        		<input type="hidden" name="target" value="employee">
            <td style="width: 220px; height: 426px; background-color: white; vertical-align: top; text-align: left;">
                <span style="font-size: 10pt"><strong>First Name: &nbsp; &nbsp;<br />
                    </strong></span>
                <input name="FirstName" style="font-weight: bold; font-size: 10pt; width: 145px; left: 1px; position: relative; top: 0px;" type="text" />
                    
                <span style="font-size: 10pt"><strong><br />Last Name:<br />
                <input name="LastName" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" />
                   
                <span style="font-size: 10pt"><strong>
                <br />Hourly Rate:&nbsp;<br />
                </strong></span>
                <input name="Wage" style="font-weight: bold; font-size: 10pt; width: 145px; left: 0px; position: relative; top: 0px;" type="text" /><br />
                        
                <span style="font-size: 10pt"><strong>Social Security Number:<br />
                <input name="SSN" style="font-weight: bold; font-size: 10pt; width: 145px" type="text" /><br />
                
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
               
                    Select Your Position Here:<br />
                    <input id="Radio1" checked="checked" name="status" type="radio" value="MANAGER"/>&nbsp; Manager<br />
                    <input id="Radio2" name="status" type="radio"  value="CUSREP"/>&nbsp; Customer Representative<br/>
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