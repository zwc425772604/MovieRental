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
    </head>
    <body>
       
    <div class = "left_sidebar">    
    <ul class = "action_list">
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "add_movie" value = "game1">Add Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "edit_movie" value = "game2">Edit Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "delete_movie" value = "game3">Delete Movie</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "add_employee" value = "game4">Add Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "edit_employee" value = "game4">Edit Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "delete_employee" value = "game4">Delete Employee</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "obtain_sales_report" value = "game4">Obtain Sales Report</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "list_all_movies" value = "game4">List all movies</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "list_movies_by" value = "game4">List movie rentals</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_best_rep" value = "game4">See Customer Rep that oversaw most rentals</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_most_active_customers" value = "game4">View most active customers </button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Customer Rep")) {%> hidden <%} %>><button class = "transcation" id = "view_most_actively_rented_movie" value = "game4">View most actively rented movies </button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Confirm orders</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Produce customer mailing lists</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Produce a list of movie suggestions for a given customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Add a customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Edit a customer</button></li>
    <li <% if(((Employee)session.getAttribute("employeeData")).getPosition().equals("Manager")) {%> hidden <%} %>><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Delete a customer</button></li>
    
    
    </ul> 
    </div>
        
       
     <div id = "add_movie_div" style ="display:inline">
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
        
        <div id = "edit_movie_div" style ="display:inline">
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
         <div id = "delete_movie_div" style ="display:inline">
             <h3>Delete an existing movie from the list</h3>
            <p> Please enter the following information about the movie:</p>
             <form action =" ">
                <label> Movie ID: </label> 
                <input type = "number" id = "delete_movie_id">
                <br/>
                <input type ="submit" id ="submit_button">
 
              </form>
        </div>
        
        <div id = "add_employee_div" style ="display:inline">
            <!-- 加翻form action  -->
            <h3> Add a new employee</h3>
            <p> Please enter the following information about the new employee:</p>
            <form action =" ">
                <label> Positions: </label> 
                <select id ="new_employee_position">
                    <option value ="Manager">Manager</option>
                    <option value ="Customer Rep">Customer Rep</option>
                </select>
                <br/>
                <label> Employee SSN: </label>
                <input type ="number" id ="new_employee_SSN" placeholder ="  9-digit">
                <br/>
                <label> Employee First Name: </label>
                <input type ="text" id ="new_employee_first_name">
                <br/>
                <label> Employee Last Name: </label>
                <input type ="text" id ="new_employee_last_name">
                <br/>
                <label> Employee Address: </label>
                <input type ="text" id ="new_employee_last_name">
                <br/>
                <label> City: </label>
                <input type ="text" id ="new_employee_last_name">
                <br/>
                <label> Address: </label>
                <input type ="text" id ="new_employee_last_name">
                <br/>
                <label> States: </label>
                <select name="State" id = "new_employee_state">
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
                <input type ="number" id ="new_employee_zip_code" placeholder =" 5-digit ">
                <br/>
                <br/>
                <label> Phone Number: </label>
                <input type ="number" id ="new_employee_phone_number" placeholder =" 10-digit ">
                <br/>
                <label> Start Date: </label>
                <input type ="date" id ="new_employee_start_date">
                <br/>
                <label> Wage: </label>
                <input type ="number" id ="new_employee_wage">
                <br/>              
                
                <input type ="submit" id ="submit_button">
             </form>
        </div>  <!-- End of add employee div   -->
        
        <div id ="edit_employee_div">
             <h3>Edit information of an employee</h3>
            <p> Please enter the following information about the new changes:</p>
             <form action =" ">
                <label> Employee SSN: </label> 
                <input type = "number" id = "edit_employee_ssn">
                <br/>
                <label> Attribute: </label> 
                <select id ="edit_employee_attr">
                    <option value ="FirstName">ID</option>
                    <option value ="LastName">FirstName</option>
                    <option value ="LastName">LastName</option>
                    <option value ="Address">Address</option>
                    <option value ="City">City</option>
                    <option value ="State">State</option>
                    <option value ="Zip">Zip</option>
                    <option value ="Phone">Phone</option>
                </select>
                <br/>
                <label> New Value: </label> 
                <input type = "text" id = "edit_employee_new_value">
                <br/>
                        
                <input type ="submit" id ="submit_button">
 
              </form>
            
            
        </div>
        
        <div id = "delete_employee_div" style ="display:inline">
             <h3>Delete an employee from the list</h3>
            <p> Please enter the following information about the employee:</p>
             <form action =" ">
                <label> Employee SSN: </label> 
                <input type = "number" id = "delete_employee_ssn">
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
        
    </body>
</html>