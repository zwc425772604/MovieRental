<%-- 
    Document   : confirmFailure
    Created on : May 4, 2017, 6:02:12 AM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation Failed</title>
    </head>
    <body>
        <h1>Confirmation Failed! Here are the possible reasons:</h1>
        <ol>
            <li>
                <h2>The customer is currently holding this movie.</h2>
            </li>
            <li>
                <h2>The customer has reached account limit:</h2>
            </li>
            <li>
                <h2>The movie is not available at this time.</h2>
            </li>
        </ol>
        <a href="EmployeeInfoServlet">Back</a>
    </body>
</html>