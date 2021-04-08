<%-- 
    Document   : register
    Created on : 15/03/2021, 3:33:53 PM
    Author     : aboud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Registration Page </title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    
    
    <body>
      
	<form action="welcome.jsp" method="post">
            <div class="container">
                <div class="header"> 
                    <h1> Register </h1> 
                    <h4> Please enter your details to create an IoTBay Account </h4>
                </div>             
                <div>
                    <p> Please select Account Type </p> 
                    
                    <label for="customer"> <b> Customer: </b> </label>
                    <input type="radio" id="customer" name="accType" value="customer">
                    
                    <label for="staff"> <b> Staff:  </b></label>
                    <input type="radio" id="staff" name="accType" value="staff" required="false">
                </div> <br>
                
               
		Staff Code: 
                <input type="text" placeholder="Enter Staff code" name="staffCode" required="true"> <br>
	
                Name:
                <input type="name" placeholder="Enter a name" name="name" required="true"> <br>
                
                Email:
                <input type="email" placeholder="Enter a email" name="email" required="true"> <br>
                
		Password:
                <input type="password" placeholder="Enter a password" name="password" required="true"> <br>
                
                
                
                <label for="tos">Agree to terms and services</label>
                <input type="checkbox" id="tos" name="tos" value="tos">
                
                <div>
                    <input type="button" class="button color" value="Cancel" onclick=location.href="index.html>
                    <input type="submit" class="button" value="Sign up">
                </div>
                
            </div>
           

	</form>
    </body>
</html>