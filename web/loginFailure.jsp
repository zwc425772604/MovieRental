<%-- 
    Document   : regFailure
    Created on : May 1, 2017, 4:49:02 PM
    Author     : ZheLin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Failed!</title>
    </head>
    <body>
        <h1>Login Failed!</h1>
        <h2>${login} is not an account of ${cusOrEmp}.</h2>
        <a href="index.jsp">return to main page</a>
    </body>
</html>
