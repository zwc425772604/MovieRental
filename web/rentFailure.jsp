<%-- 
    Document   : rentFailure
    Created on : May 3, 2017, 4:29:20 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rental Failed</title>
    </head>
    <body>
        <h1>Rental Failed! Here are the possible reasons:</h1>
        <ol>
            <li>
                <h2>You are currently holding this movie.</h2>
            </li>
            <li>
                <h2>You have reached your account limit:</h2>
                <ul>
                    <li>The LIMITED plan allows you to view 1 movie at-a-time and at most 2 movies per month.</li>
                    <li>The UNLIMITED1 plan allows you to view 1 movie at-a-time and unlimited movies per month.</li>
                    <li>The UNLIMITED2 plan allows you to view 2 movie at-a-time and unlimited movies per month.</li>
                    <li>The UNLIMITED3 plan allows you to view 3 movie at-a-time and unlimited movies per month.</li>
                </ul>
            </li>
            <li>
                <h2>The movie is not available at this time.</h2>
            </li>
        </ol>
        <a href="CustomerInfoServlet">Back</a>
    </body>
</html>
