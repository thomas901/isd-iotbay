<%@page import="uts.isd.model.OrderedItem"%>
<%@page import="uts.isd.model.Order"%>
<%@page import="java.util.LinkedList"%>
<%@page import="uts.isd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //for testing
    Customer customer = (Customer)session.getAttribute("customer");
    LinkedList<OrderedItem> order = (LinkedList<OrderedItem>)session.getAttribute("savedOrder");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order <%=request.getParameter("orderID")%></h1>
        <h2>This order has been saved but not yet submitted</h2>
        <a class="button" href="account.jsp">Back to account</a><br>
        <% if (order == null) { %>
            <h2>An error occurred trying to retrieve this order</h2>
        <% } else if (order.size() == 0) { %>
            <h2>This order contained no items</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    
                </tr>
            <% for (OrderedItem item : order) { %>
                <tr>
                    <td><%=item.getName()%></td>
                    <td><%=item.getQuantity()%></td>
                </tr>
            <% }  %>
            </table>
        <% } %>
        <form action="UpdateSavedOrderController" method="post" id="updateForm">
            <p>Choose existing payment method (not yet implemented)</p>
            <select name="paymentID" form="updateForm">
                <option value=100>100</option>
                <option value=101>101</option>
                <option value=102>102</option>
            </select><br>
            <button type="button">Add payment method (not yet implemented)</button>
            <p>Choose existing address (not yet implemented)</p>
            <select name="addressID" form="updateForm">
                <option value=""></option>
                <option value=100>100</option>
                <option value=101>101</option>
                <option value=102>102</option>
            </select>
            <p>Or enter new address</p>
            <input type="textarea" name="address" rows="3"></input><br>
            <input type="hidden" name="orderID" value=<%=request.getParameter("orderID")%>>
            <input type="submit" class="button" name="submit" value="Submit order">
            <input type="submit" class="button" name="save" value="Save order">
            <input type="submit" class="button" name="cancel" value="Cancel order">
	</form>
    </body>
</html>