<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    LinkedList<Product> allProducts = (LinkedList<Product>)session.getAttribute("allProducts");
    session.removeAttribute("quantityError");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to the shop</h1>
        <a href="account.jsp">Account</a><br>
        <a href="cart.jsp">Cart</a>
        <% if (allProducts == null) { %>
            <h2>An error occurred trying to retrieve products</h2>
        <% } else if (allProducts.size() == 0) { %>
            <h2>No products found</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Category ID</th>
                    <th>Stock</th>
                    <th>Price</th>
                    
                </tr>
            <% for (Product product : allProducts) { %>
                <tr>
                    <td><%=product.getName()%></td>
                    <td><%=product.getBrand()%></td>
                    <td><%=product.getCategoryID()%></td>
                    <td><%=product.getStock()%></td>
                    <td><%=product.getPrice()%></td>
                    <td><a href="ViewProductController?productID=<%=product.getProductID()%>">View</a></td>
                </tr>
            <% }  %>
            </table>
        <% } %>
    </body>
</html>
