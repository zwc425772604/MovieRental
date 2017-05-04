<%-- 
    Document   : customerAccount
    Created on : May 3, 2017, 11:34:27 PM
    Author     : ZheLin
--%>

<%@page import="users.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Setting</title>
        <link href="css/register_page.css" rel="stylesheet" type="text/css">
    <script language="javascript" type="text/javascript">

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
            else if(document.myForm.Zip.value.length != 5)
                alert("Zip Code must 5 digits long!!!")
            else if(document.myForm.Telephone.value.length != 10)
                alert("Telephone must 10 digits long!!!")
            else if(document.myForm.CreditCard.value.length != 16)
                alert("Credit Card Number must be 16 digits long!!!")
            else{document.myForm.submit()}
        }

        function Button2_onclick() {
            window.open("CustomerInfoServlet","_self");

        }

    </script>
    </head>
    <body style="text-align: center" bgcolor="white">

      <span><strong><span style="font-size: 14pt; font-family: Arial">
        <table border="0" cellpadding="0" cellspacing="0" style="font-size: 14pt; width: 100%;
            height: 100%" id="TABLE1">
            <tr>
                <td colspan="2" style="height: 63px; text-align: center; background-color: white;">
                    Account Setting</td>
            </tr>
            <tr>
                    <form name="myForm" action="CustomerEditSetting" method="post">
                            <input type="hidden" name="target" value="customer">
                <td style="width: 220px; height: 426px; background-color: white; vertical-align: top; text-align: left;">
                    <span style="font-size: 10pt"><strong>First Name: &nbsp; &nbsp;<br />
                        </strong></span>
                    <input name="FirstName" class = "customer_first_name" type="text" value="${customerData.FName}"/>

                    <span style="font-size: 10pt"><strong><br />Last Name:<br />
                    <input name="LastName" class = "customer_last_name" type="text" value="${customerData.LName}"/>

                    <br/>
                    <span style="font-size: 10pt"><strong>Email:<br />
                    <input name="Email" class = "customer_email" type="text" value="${customerData.email}"/><br />

                    <span style="font-size: 10pt"><strong>Address:<br />
                    <input name="Address" class = "customer_address" type="text" value="${customerData.address}"/><br />

                    <span style="font-size: 10pt"><strong>City:<br />
                    <input name="City" class = "customer_city" type="text" value="${customerData.city}"/><br />

                    <span style="font-size: 10pt"><strong>State:<br />
                    <select name="State">
                        <option value="AL" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AL")) {%> SELECTED <%} %>>Alabama</option>
                        <option value="AK" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AK")) {%> SELECTED <%} %>>Alaska</option>
                        <option value="AZ" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AZ")) {%> SELECTED <%} %>>Arizona</option>
                        <option value="AR" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AR")) {%> SELECTED <%} %>>Arkansas</option>
                        <option value="CA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("CA")) {%> SELECTED <%} %>>California</option>
                        <option value="CO" <% if(((Customer)session.getAttribute("customerData")).getState().equals("CO")) {%> SELECTED <%} %>>Colorado</option>
                        <option value="CT" <% if(((Customer)session.getAttribute("customerData")).getState().equals("CT")) {%> SELECTED <%} %>>Connecticut</option>
                        <option value="DE" <% if(((Customer)session.getAttribute("customerData")).getState().equals("DE")) {%> SELECTED <%} %>>Delaware</option>
                        <option value="DC" <% if(((Customer)session.getAttribute("customerData")).getState().equals("DC")) {%> SELECTED <%} %>>District Of Columbia</option>
                        <option value="FL" <% if(((Customer)session.getAttribute("customerData")).getState().equals("FL")) {%> SELECTED <%} %>>Florida</option>
                        <option value="GA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("GA")) {%> SELECTED <%} %>>Georgia</option>
                        <option value="HI" <% if(((Customer)session.getAttribute("customerData")).getState().equals("HI")) {%> SELECTED <%} %>>Hawaii</option>
                        <option value="ID" <% if(((Customer)session.getAttribute("customerData")).getState().equals("ID")) {%> SELECTED <%} %>>Idaho</option>
                        <option value="IL" <% if(((Customer)session.getAttribute("customerData")).getState().equals("IL")) {%> SELECTED <%} %>>Illinois</option>
                        <option value="IN" <% if(((Customer)session.getAttribute("customerData")).getState().equals("IN")) {%> SELECTED <%} %>>Indiana</option>
                        <option value="IA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("IA")) {%> SELECTED <%} %>>Iowa</option>
                        <option value="KS" <% if(((Customer)session.getAttribute("customerData")).getState().equals("KS")) {%> SELECTED <%} %>>Kansas</option>
                        <option value="KY" <% if(((Customer)session.getAttribute("customerData")).getState().equals("KY")) {%> SELECTED <%} %>>Kentucky</option>
                        <option value="LA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("LA")) {%> SELECTED <%} %>>Louisiana</option>
                        <option value="ME" <% if(((Customer)session.getAttribute("customerData")).getState().equals("ME")) {%> SELECTED <%} %>>Maine</option>
                        <option value="MD" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MD")) {%> SELECTED <%} %>>Maryland</option>
                        <option value="MA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MA")) {%> SELECTED <%} %>>Massachusetts</option>
                        <option value="MI" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MI")) {%> SELECTED <%} %>>Michigan</option>
                        <option value="MN" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MN")) {%> SELECTED <%} %>>Minnesota</option>
                        <option value="MS" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MS")) {%> SELECTED <%} %>>Mississippi</option>
                        <option value="MO" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MO")) {%> SELECTED <%} %>>Missouri</option>
                        <option value="MT" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MT")) {%> SELECTED <%} %>>Montana</option>
                        <option value="NE" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NE")) {%> SELECTED <%} %>>Nebraska</option>
                        <option value="NV" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NV")) {%> SELECTED <%} %>>Nevada</option>
                        <option value="NH" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NH")) {%> SELECTED <%} %>>New Hampshire</option>
                        <option value="NJ" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NJ")) {%> SELECTED <%} %>>New Jersey</option>
                        <option value="NM" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NM")) {%> SELECTED <%} %>>New Mexico</option>
                        <option value="NY" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NY")) {%> SELECTED <%} %>>New York</option>
                        <option value="NC" <% if(((Customer)session.getAttribute("customerData")).getState().equals("NC")) {%> SELECTED <%} %>>North Carolina</option>
                        <option value="ND" <% if(((Customer)session.getAttribute("customerData")).getState().equals("ND")) {%> SELECTED <%} %>>North Dakota</option>
                        <option value="OH" <% if(((Customer)session.getAttribute("customerData")).getState().equals("OH")) {%> SELECTED <%} %>>Ohio</option>
                        <option value="OK" <% if(((Customer)session.getAttribute("customerData")).getState().equals("OK")) {%> SELECTED <%} %>>Oklahoma</option>
                        <option value="OR" <% if(((Customer)session.getAttribute("customerData")).getState().equals("OR")) {%> SELECTED <%} %>>Oregon</option>
                        <option value="PA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("PA")) {%> SELECTED <%} %>>Pennsylvania</option>
                        <option value="RI" <% if(((Customer)session.getAttribute("customerData")).getState().equals("RI")) {%> SELECTED <%} %>>Rhode Island</option>
                        <option value="SC" <% if(((Customer)session.getAttribute("customerData")).getState().equals("SC")) {%> SELECTED <%} %>>South Carolina</option>
                        <option value="SD" <% if(((Customer)session.getAttribute("customerData")).getState().equals("SD")) {%> SELECTED <%} %>>South Dakota</option>
                        <option value="TN" <% if(((Customer)session.getAttribute("customerData")).getState().equals("TN")) {%> SELECTED <%} %>>Tennessee</option>
                        <option value="TX" <% if(((Customer)session.getAttribute("customerData")).getState().equals("TX")) {%> SELECTED <%} %>>Texas</option>
                        <option value="UT" <% if(((Customer)session.getAttribute("customerData")).getState().equals("UT")) {%> SELECTED <%} %>>Utah</option>
                        <option value="VT" <% if(((Customer)session.getAttribute("customerData")).getState().equals("VT")) {%> SELECTED <%} %>>Vermont</option>
                        <option value="VA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("VA")) {%> SELECTED <%} %>>Virginia</option>
                        <option value="WA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("WA")) {%> SELECTED <%} %>>Washington</option>
                        <option value="WV" <% if(((Customer)session.getAttribute("customerData")).getState().equals("WV")) {%> SELECTED <%} %>>West Virginia</option>
                        <option value="WI" <% if(((Customer)session.getAttribute("customerData")).getState().equals("WI")) {%> SELECTED <%} %>>Wisconsin</option>
                        <option value="WY" <% if(((Customer)session.getAttribute("customerData")).getState().equals("WY")) {%> SELECTED <%} %>>Wyoming</option>
                        <option value="AS" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AS")) {%> SELECTED <%} %>>American Samoa</option>
                        <option value="FM" <% if(((Customer)session.getAttribute("customerData")).getState().equals("FM")) {%> SELECTED <%} %>>Micronesia</option>
                        <option value="GU" <% if(((Customer)session.getAttribute("customerData")).getState().equals("GU")) {%> SELECTED <%} %>>Guam</option>
                        <option value="MH" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MH")) {%> SELECTED <%} %>>Marshall Islands</option>
                        <option value="MP" <% if(((Customer)session.getAttribute("customerData")).getState().equals("MP")) {%> SELECTED <%} %>>Northern Mariana Islands</option>
                        <option value="PR" <% if(((Customer)session.getAttribute("customerData")).getState().equals("PR")) {%> SELECTED <%} %>>Puerto Rico</option>
                        <option value="PW" <% if(((Customer)session.getAttribute("customerData")).getState().equals("PW")) {%> SELECTED <%} %>>Palau</option>
                        <option value="UM" <% if(((Customer)session.getAttribute("customerData")).getState().equals("UM")) {%> SELECTED <%} %>>United States Minor Outlying Islands</option>
                        <option value="VI" <% if(((Customer)session.getAttribute("customerData")).getState().equals("VI")) {%> SELECTED <%} %>>Virgin Islands</option>
                        <option value="AA" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AA")) {%> SELECTED <%} %>>Armed Forces Americas</option>
                        <option value="AP" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AP")) {%> SELECTED <%} %>>Armed Forces Pacific</option>
                        <option value="AE" <% if(((Customer)session.getAttribute("customerData")).getState().equals("AE")) {%> SELECTED <%} %>>Armed Forces Others</option>	 
                    </select>
                    <br/>

                    <span style="font-size: 10pt"><strong>Zip Code:<br />
                    <input name="Zip" placeholder = "5-digit zip code" class = "customer_zip" type="text" value="${customerData.zip}"/><br />

                    <span style="font-size: 10pt"><strong>Telephone:<br />
                            <input name="Telephone" placeholder="10-digit phone#" class = "customer_telephone" type="text" value="${customerData.phone}"/><br />

                    <span style="font-size: 10pt"><strong>Credit Card Number:<br />
                    <input name="CreditCard" placeholder = "16-digit card#"class = "customer_credit_card" type="text" value="${customerData.card}"/><br />

                        Select Your Plan Here:<br />
                        <input id="Radio1" name="status" type="radio" value="Limited" <% if(((Customer)session.getAttribute("customerData")).getType().equals("Limited")) {%> CHECKED <%} %>/>&nbsp; LIMITED<br />
                        <input id="Radio2" name="status" type="radio"  value="Unlimited" <% if(((Customer)session.getAttribute("customerData")).getType().equals("Unlimited")) {%> CHECKED <%} %>/>&nbsp; UNLIMITED1&nbsp;<br/>
                        <input id="Radio3" name="status" type="radio"  value="Unlimited+" <% if(((Customer)session.getAttribute("customerData")).getType().equals("Unlimited+")) {%> CHECKED <%} %>/>&nbsp; UNLIMITED2&nbsp;<br />
                        <input id="Radio4" name="status" type="radio"  value="Unlimited++" <% if(((Customer)session.getAttribute("customerData")).getType().equals("Unlimited++")) {%> CHECKED <%} %>/>&nbsp; UNLIMITED3<br />
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
                <img style="max-height:200px" src="img/popcorn.jpg" /></td>
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
