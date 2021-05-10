<%@page import="uts.isd.model.Cart"%>
<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Product product = (Product)session.getAttribute("product");
    String quantityError = (String)session.getAttribute("quantityError");
    Cart cart = (Cart)session.getAttribute("cart");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Product</h1>
        <a class="button" href="ShopController">Back to shop</a>
        <% if (quantityError != null) { %>
            <h2><%=quantityError%></h2>
        <% } %>
        <p><%=product.getName()%></p>
        <p><%=product.getDescription()%></p>
        <p>Quantity in stock: <%=product.getStock()%></p>
        <% if (cart.quantityOf(product.getProductID()) > 0) { %>
            <p>Quantity in cart: <%=cart.quantityOf(product.getProductID())%></p>
        <% } %>
        <form action="AddToCartController" method="post">
            <button type="button" onclick="decreaseQuantity()">-</button>
            <input id="quantity" type="number" name="quantity" value=0>
            <button type="button" onclick="increaseQuantity()">+</button><br>    

            <input type="submit" value="Add to cart">
        </form>
        <script>
            function decreaseQuantity() {
                var value = parseInt(document.getElementById("quantity").value);
                if (value > 0) {
                    value -= 1;
                }
                document.getElementById("quantity").value = value;
            }
            
            function increaseQuantity() {
                var value = parseInt(document.getElementById("quantity").value);
                if (value < <%=product.getStock()-cart.quantityOf(product.getProductID())%>) {
                    value += 1;
                }
                document.getElementById("quantity").value = value;  
            }
        </script>    
    </body>
</html>
