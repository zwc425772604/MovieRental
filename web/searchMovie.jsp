<%-- 
    Document   : searchMovie
    Created on : May 2, 2017, 9:54:07 PM
    Author     : Weichao ZHao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trappist1-f Movie Search Tool</title>
    </head>
  <body style="text-align: center" bgcolor="aliceblue">

  <span><strong><span style="font-size: 14pt; font-family: Arial">
    <table border="0" cellpadding="0" cellspacing="0" style="font-size: 14pt; width: 100%;
        height: 100%" id="TABLE1" onclick="return TABLE1_onclick()">
        <tr>
            <td colspan="2" style="height: 63px; text-align: center; ">
                Search Movie</td>
        </tr>
        <tr>
        	<form name="myForm" action="searchResults.jsp" method="post">
            <td style="width: 220px; height: 426px; vertical-align: top; text-align: left;">
                <span style="font-size: 10pt"><strong>Fill out one of the following entries for searching:<br />
                    <br />
                 
                    Movie Type: &nbsp; &nbsp;<br />
                </strong>
                
                </span>
                
                <input name="movie_type" placeholder ="Comedy, Drama, Action, Foreign" style="font-weight: bold; font-size: 10pt; width: 250px; left: 1px; position: relative; top: 0px;" type="text" />
                <span
                    style="font-size: 10pt" ><strong>
                        <br />
                        Movie Keyword:&nbsp;<br />
                    </strong></span>
                <input name="movie_keyword" placeholder ="title of the movie" style="font-weight: bold; font-size: 10pt; width: 250px; left: 0px; position: relative; top: 0px;" type="text" /><br />
                <span style="font-size: 10pt">
               
                <span style="font-size: 10pt"><strong>Actor/Actors:<br />
                    <input name="movie_casted_actor" placeholder="actor's first name or last name" style="font-weight: bold; font-size: 10pt; width: 250px"
                        type="text" />
                    <br />
                    <span style="font-size: 8pt; font-family: Arial">
                     <br/>
                    <input id="Button3" type="submit" value="Submit" />&nbsp;
                    <input id="Button1" type="button" value="Logout" onclick="window.open('index.jsp','_self');" /><br />
                   
             
            </td>
      
          </form>
        </tr>
    </table>
</span>
                    </strong>

</body>
</html>

