<%@page import="uts.isd.User"%>
<%@page import="uts.isd.UserList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String submitted = request.getParameter("submitted"); %>
<% UserList temp = (UserList)application.getAttribute("userList");
if (temp == null) {
   application.setAttribute("userList", new UserList());
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Registration Page </title>
        <link rel="stylesheet" href="register.css">
    </head>
    
    <body>
	<form action="register.jsp" method="post">
            <div class="container">
                <div class="header"> 
                    <h1> <b> Register </b> </h1> 
                    <h4> Please enter your details to create an IoTBay Account </h4>
                </div>  
                
                <div>
                    <p> Please select Account Type </p> 
                    <label for="customer"> <b> Customer: </b> </label>
                    <input type="radio" id="customer" name="accType" value="customer" onclick="hideField()" required>
                    
                    <label for="staff"> <b> Staff:  </b></label>
                    <input type="radio" id="staff" name="accType" value="staff" onclick="showField()" required>
                </div> 
               
                <div id="isStaff" style="display:none;">
                    <p> Staff Code: </p> 
                    <input type="text" placeholder="Enter Staff code" name="staffCode" >
                </div>
                
                <p> Name: </p>
                <input type="name" placeholder="Enter a name" name="name" required> 
                
                <p> Email:</p>
                <input type="email" placeholder="Enter a email" name="email" required> 
                
                <p> Password: </p>
                <input type="password" placeholder="Enter a password" name="password" required> 
                
                 <p> Phone Number: </p>
                <input type="tel"  placeholder="0412345678" pattern="[0-9]{10}" name="phoneNum"required> 
                
                <p> Date of Birth: </p>
                <input type="date" name="dob" required> 
                
                <div>
                    <p> Please select gender </p> 
                    <label for="male"> <b> Male: </b> </label>
                    <input type="radio" id="male" name="gender" value="male" required>
                    
                    <label for="female"> <b> Female:  </b></label>
                    <input type="radio" id="female" name="gender" value="female" required>
                    
                    <label for="other"> <b> Other:  </b></label>
                    <input type="radio" id="other" name="gender" value="female" required>
                </div> <br>
                
                
          
                
                <label for="tos"> Agree to terms and services </label> <br>
                <input type="checkbox" id="tos" name="tos" value="tos" required>
                
                <div>
                    <input type="button" class="button button-color " value="Cancel" onclick=location.href="landing.jsp"> 
                    <input type="hidden" name="submitted" value="yes">
                    <input type="submit" class="button " value="Sign up">
                </div>
                <% if (submitted != null) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String accountType = request.getParameter("accType");
                UserList userList = (UserList)application.getAttribute("userList");
                if (userList.unusedEmail(email)) {
                    User user = new User(email, password, name, accountType);
                    userList.addUser(user);
                    session.setAttribute("user", user);
                    response.sendRedirect("welcome.jsp");
                } else {
                    %> <p class="error">That email is already in use</p> <%
                }
                } %>
            </div>
            
	</form>
        
        <script>
            function showField() {
              var formType = document.getElementById("isStaff");
              if (formType.style.display === "none") {
                formType.style.display = "block";
                }
            }
            function hideField() {
              var formType = document.getElementById("isStaff");
              if (formType.style.display === "block") {
                formType.style.display = "none";
                }
            }
        </script>
        
    </body>
</html>
