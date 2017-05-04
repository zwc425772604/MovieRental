<%-- 
    Document   : EmployeeInformationPage
    Created on : May 4, 2017, 4:10:49 AM
    Author     : Weichao ZHao
--%>

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
    <li><button class = "transcation" id = "add_movie" value = "game1">Add Movie</button></li>
    <li><button class = "transcation" id = "edit_movie" value = "game2">Edit Movie</button></li>
    <li><button class = "transcation" id = "delete_movie" value = "game3">Delete Movie</button></li>
    <li><button class = "transcation" id = "add_employee" value = "game4">Add Employee</button></li>
    <li><button class = "transcation" id = "edit_employee" value = "game4">Edit Employee</button></li>
    <li><button class = "transcation" id = "delete_employee" value = "game4">Delete Employee</button></li>
    <li><button class = "transcation" id = "obtain_sales_report" value = "game4">Obtain Sales Report</button></li>
    <li><button class = "transcation" id = "list_all_movies" value = "game4">List all movies</button></li>
     <li><button class = "transcation" id = "list_movies_by" value = "game4">List movie rentals</button></li>
    <li><button class = "transcation" id = "view_most_active_customers" value = "game4">View most active customers </button></li>
    <li><button class = "transcation" id = "view_most_actively_rented_movie" value = "game4">View most actively rented movies </button></li>
    <li><button class = "transcation" id = "confirm_order" onclick="window.open('confirmOrder.jsp','_self');">Confirm Orders</button></li>
    
    </ul> 
    </div>
        
        <div id = "add_movie_div" style ="display:inline">
            <!-- added form action  -->
            <h4> Add a new movie: </h4>
            <form action =" ">
                <label> Enter Movie Name: </label> 
                <input type = "text" id = "new_movie_name">
                <br/>
                <label> Enter Movie Genre: </label>
                <input type ="text" id ="new_movie_genre">
                <br/>
                 <label> Movie Fee: </label>
                <input type ="number" id ="new_movie_fee">
                <br/>
                 <label> Enter Total Copies of the Movie: </label>
                <input type ="number" id ="new_movie_copies">
                <br/>
                <input type ="submit" id ="submit_button">
                                
            </form>
        </div>
        <br/>
        <br/>
        <div id = "edit_movie_div" style ="display:inline">
            <h4>Edit an existing movie information</h4>
             <form action =" ">
                <label> Enter Movie ID: </label> 
                <input type = "number" id = "edit_movie_id">
                <br/>
                <label> Enter Movie Attribute: </label>
                <input type ="text" id ="edit_movie_attr">
                <br/>
                 <label> Movie New Value: </label>
                <input type ="text" id ="new_movie_value">
                <br/>

 
              </form>
            
        </div>
    </body>
</html>
