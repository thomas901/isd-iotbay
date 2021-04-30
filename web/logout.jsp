<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
            <title> Home Page </title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, intial-scale=1.0">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
            <link rel="stylesheet" href="css/index.css">
    </head>
	
    <body>
        <header id="IoTBay">
            <div class="header">
                <h1> IoTBay </h1>
                <h2> You have successfully logged out </h2>
                <% session.invalidate(); %>
            </div>
        </header>

        <div class="container">
            <input type="button" class="button" value="Back" onclick=location.href="landing.jsp">
        </div>
    </body> 
    
</html>
