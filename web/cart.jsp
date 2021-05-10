<%@page import="uts.isd.model.CartItem"%>
<%@page import="uts.isd.model.Cart"%>
<%@page import="java.util.LinkedList"%>
<%@page import="uts.isd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    Cart cart = (Cart)session.getAttribute("cart");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your cart</h1>
        <a href="account.jsp">Account</a><br>
        <a class="button" href="ShopController">Shop</a>
        <% if (cart == null || cart.isEmpty()) { %>
            <h2>Your cart is empty</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    
                </tr>
            <% for (CartItem item : cart.getCart()) { %>
                <tr>
                    <td><%=item.getName()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><a href="RemoveFromCartController?productID=<%=item.getProductID()%>">Remove</a></td>
                </tr>
            <% }  %>
            </table>
            <a href="CheckoutController">Checkout cart</a>
        <% } %>
    </body>
</html>