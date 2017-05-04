<%-- 
    Document   : EmployeeInformationPage
    Created on : May 4, 2017, 4:10:49 AM
    Author     : Weichao ZHao
--%>

<%@page import="users.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script>
        $(document).ready(function()
        {
//            $("#add_movie").click(function(event){
//                $('div').hide();
//                document.getElementById("add_movie_div").style.display = "inline";
//            });
            
            $("button").click(function()
            {
                 //alert($(this).val());
                 $('div').hide();
                 document.getElementById($(this).val()).style.display = "inline";
            });
            
            });
 
        
    </script>
    </head>
    <body>
       
       
    <ul class = "action_list">
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "add_movie" value = "add_movie_div">Add Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "edit_movie" value = "edit_movie_div">Edit Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "delete_movie" value = "delete_movie_div">Delete Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "add_employee" value = "add_employee_div">Add Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "edit_employee" value = "edit_employee_div">Edit Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "delete_employee" value = "delete_employee_div">Delete Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "obtain_sales_report" value = "sales_report_div" onclick="window.open('salesReport.jsp','_self');">Obtain Sales Report</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "list_all_movies" value = "lists_of_all_movies_div">List all movies</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "list_movies_by" value = "list_of_movie_rentals">List movie rentals</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_best_rep" value = "list_of_customer_rep_who_oversaw_most_rental">See Customer Rep that oversaw most rentals</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_most_active_customers" value = "list_of_active_customers">View most active customers </button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_most_actively_rented_movie" value = "list_of_active_rented_movies">View most actively rented movies </button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Confirm orders</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Produce customer mailing lists</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Produce a list of movie suggestions for a given customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Add a customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Edit a customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Delete a customer</button></li>
    
    
    </ul> 
   
        
       
     <div id = "add_movie_div" style ="display:none">
            <!-- 加翻form action  -->
            <h3> Add a new movie to the list</h3>
            <p> Please enter the following information about the movie:</p>
            <form action =" ">
                <label> Movie Name: </label> 
                <input type = "text" id = "new_movie_name" value = "">
                <br/>
                <label> Movie Genre: </label>
                <select id = "new_movie_genre">
                    <option value="Drama">Drama</option>
                    <option value="Comedy">Comedy</option>
                    <option value="Action">Action</option>
                    <option value="Foreign">Foreign</option>
                </select>
                <br/>
                 <label> Movie Fee: </label>
                <input type ="number" id ="new_movie_fee" value = "">
                <br/>
                 <label> Total Copies of the  new Movie: </label>
                <input type ="number" id ="new_movie_copies" value = "">
                <br/>
                <input type ="submit" id ="submit_button">
             </form>
        </div>
        <br/>
        <br/>
        
        <div id = "edit_movie_div" style ="display:none">
            <h3>Edit an existing movie information</h3>
            <p> Please enter the following information about the movie:</p>
             <form action =" ">
                <label> Movie ID: </label> 
                <input type = "number" id = "edit_movie_id" value = "">
                <br/>
                <label> Movie Attribute: </label>
                <input type ="text" id ="edit_movie_attr" value = "">
                <br/>
                 <label> Movie New Value: </label>
                <input type ="text" id ="new_movie_value" value = "">
                <br/>
                <input type ="submit" id ="submit_button">
 
              </form>
        </div>
         <div id = "delete_movie_div" style ="display:none">
             <h3>Delete an existing movie from the list</h3>
            <p> Please enter the following information about the movie:</p>
             <form action =" ">
                <label> Movie ID: </label> 
                <input type = "number" id = "delete_movie_id">
                <br/>
                <input type ="submit" id ="submit_button">
 
              </form>
        </div>
        
        <div id = "add_employee_div" style ="display:none">
            <!-- 加翻form action  -->
            <h3> Add a new employee</h3>
            <p> Please enter the following information about the new employee:</p>
            <form action ="MaddE" method = "post">
                <label> Positions: </label> 
                <select name="status1">
                    <option value ="Manager">Manager</option>
                    <option value ="Customer Rep">Customer Rep</option>
                </select>
                <br/>
                <label> Employee SSN: </label>
                <input type ="number" name="SSN1" placeholder ="  9-digit">
                <br/>
                <label> Employee First Name: </label>
                <input type ="text" name="FirstName1">
                <br/>
                <label> Employee Last Name: </label>
                <input type ="text" name="LastName1">
                <br/>
                <label> City: </label>
                <input type ="text" name="City1">
                <br/>
                <label> Address: </label>
                <input type ="text" name="Address1">
                <br/>
                <label> States: </label>
                <select name="State1">
                    <option value="AL">Alabama</option>
                    <option value="AK">Alaska</option>
                    <option value="AZ">Arizona</option>
                    <option value="AR">Arkansas</option>
                    <option value="CA">California</option>
                    <option value="CO">Colorado</option>
                    <option value="CT">Connecticut</option>
                    <option value="DE">Delaware</option>
                    <option value="DC">District Of Columbia</option>
                    <option value="FL">Florida</option>
                    <option value="GA">Georgia</option>
                    <option value="HI">Hawaii</option>
                    <option value="ID">Idaho</option>
                    <option value="IL">Illinois</option>
                    <option value="IN">Indiana</option>
                    <option value="IA">Iowa</option>
                    <option value="KS">Kansas</option>
                    <option value="KY">Kentucky</option>
                    <option value="LA">Louisiana</option>
                    <option value="ME">Maine</option>
                    <option value="MD">Maryland</option>
                    <option value="MA">Massachusetts</option>
                    <option value="MI">Michigan</option>
                    <option value="MN">Minnesota</option>
                    <option value="MS">Mississippi</option>
                    <option value="MO">Missouri</option>
                    <option value="MT">Montana</option>
                    <option value="NE">Nebraska</option>
                    <option value="NV">Nevada</option>
                    <option value="NH">New Hampshire</option>
                    <option value="NJ">New Jersey</option>
                    <option value="NM">New Mexico</option>
                    <option value="NY">New York</option>
                    <option value="NC">North Carolina</option>
                    <option value="ND">North Dakota</option>
                    <option value="OH">Ohio</option>
                    <option value="OK">Oklahoma</option>
                    <option value="OR">Oregon</option>
                    <option value="PA">Pennsylvania</option>
                    <option value="RI">Rhode Island</option>
                    <option value="SC">South Carolina</option>
                    <option value="SD">South Dakota</option>
                    <option value="TN">Tennessee</option>
                    <option value="TX">Texas</option>
                    <option value="UT">Utah</option>
                    <option value="VT">Vermont</option>
                    <option value="VA">Virginia</option>
                    <option value="WA">Washington</option>
                    <option value="WV">West Virginia</option>
                    <option value="WI">Wisconsin</option>
                    <option value="WY">Wyoming</option>
                    <option value="AS">American Samoa</option>
                    <option value="FM">Micronesia</option>
                    <option value="GU">Guam</option>
                    <option value="MH">Marshall Islands</option>
                    <option value="MP">Northern Mariana Islands</option>
                    <option value="PR">Puerto Rico</option>
                    <option value="PW">Palau</option>
                    <option value="UM">United States Minor Outlying Islands</option>
                    <option value="VI">Virgin Islands</option>
                    <option value="AA">Armed Forces Americas</option>
                    <option value="AP">Armed Forces Pacific</option>
                    <option value="AE">Armed Forces Others</option>	 
                </select>
                <br/>
                <label> Zip Code: </label>
                <input type ="number" name="Zip1" placeholder =" 5-digit ">
                <br/>
                <br/>
                <label> Phone Number: </label>
                <input type ="number" name="Telephone1" placeholder =" 10-digit ">
                <br/>
                <label> Hourly Rate: </label>
                <input type ="number" name="Wage1">
                <br/>              
                
                <input type ="submit" id ="submit_button">
             </form>
        </div>  <!-- End of add employee div   -->
        
        <div id ="edit_employee_div" style="display:none">
             <h3>Edit information of an employee</h3>
            <p> Please enter the following information about the new changes:</p>
             <form action ="MeditE" method="post">
                <label> Employee SSN: </label> 
                <input type = "number" name = "edit_employee_ssn">
                <br/>
                <label> Attribute: </label> 
                <select name ="edit_employee_attr">
                    <option value ="FirstName">FirstName</option>
                    <option value ="LastName">LastName</option>
                    <option value ="Address">Address</option>
                    <option value ="City">City</option>
                    <option value ="State">State</option>
                    <option value ="Zip">Zip</option>
                    <option value ="Phone">Phone</option>
                    <option value ="HourlyRate">Wage</option>
                    <option value ="Position">Position</option>
                </select>
                <br/>
                <label> New Value: </label> 
                <input type = "text" name = "edit_employee_new_value">
                <br/>
                        
                <input type ="submit" id ="submit_button">
 
              </form>
            
            
        </div>
        
        <div id = "delete_employee_div" style ="display:none">
             <h3>Delete an employee from the list</h3>
            <p> Please enter the following information about the employee:</p>
             <form action ="MdelE" method="post">
                <label> Employee SSN: </label> 
                <input type = "number" name = "delete_employee_ssn">
                <br/>
                <input type ="submit" id ="submit_button">
 
              </form>
        </div>
        
        <!-- sales report display here  -->
        <div id="sales_report_div"style="display:none" >  </div>
         <!-- list all the movies  -->
        <div id="lists_of_all_movies_div" style="display:none"></div>
        <!-- list current rented movies  -->
        <div id="list_of_movie_rentals" style="display:none"></div>
        <!-- list current rented movies  -->
        <div id="list_of_active_customers" style="display:none"></div>
        <!-- list of most actively rented movie -->
         <div id="list_of_active_rented_movies" style="display:none"></div>
        <!-- list of customer rep who oversaw most rental -->
        <div id="list_of_customer_rep_who_oversaw_most_rental" style="display:none"></div>
    </body>
</html>