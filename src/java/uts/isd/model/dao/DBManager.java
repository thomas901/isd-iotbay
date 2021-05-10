package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.LinkedList;
import uts.isd.model.Cart;
import uts.isd.model.CartItem;
import uts.isd.model.Order;
import uts.isd.model.OrderedItem;
import uts.isd.model.Product;
/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {
    private Statement st;

    public DBManager(Connection conn) throws SQLException {       
        st = conn.createStatement();   
    }
    
    public void executeUpdate(String update) throws SQLException {
        st.executeUpdate(update);
    }
    
    public void printQuery(String query) throws SQLException {
        ResultSet rs = st.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                System.out.print(rs.getString(i));
            }
            System.out.println("");
        }
    }
    
    public LinkedList<Order> getPastOrders(int customerID) throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FullfilledBy, AddressID, Address, PaymentID, Paid, DatePaid from \"ORDER\" where status <> 'Saved' and customerID = " + customerID; //order is keyword in SQL so needs to be 'stringed'
        ResultSet rs = st.executeQuery(query);
        LinkedList<Order> orders = new LinkedList<>();
        
        while (rs.next()) {
            orders.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11), rs.getDate(12)));
        }
        return orders;
    }
    
    public LinkedList<Order> getPastOrders(int customerID, String startDate, String endDate, int startID, int endID) throws SQLException {
        //explicitly define order to use constructor in same order   
        String query = "select OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FullfilledBy, AddressID, Address, PaymentID, Paid, DatePaid from \"ORDER\" where status <> 'Saved' and customerID = " + customerID + " and (orderID between " + startID + " and " + endID + ")" + " and (orderedDate between '" + startDate + "' and '" + endDate + "')"; //order is keyword in SQL so needs to be 'stringed'
        ResultSet rs = st.executeQuery(query);
        LinkedList<Order> orders = new LinkedList<>();
        
        while (rs.next()) {
            orders.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11), rs.getDate(12)));
        }
        return orders;
    }
    
    public LinkedList<OrderedItem> getPastOrder(int orderID) throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select name, quantity from orderlineitem inner join product on product.productid = orderlineitem.productid where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        LinkedList<OrderedItem> order = new LinkedList<>();
        
        while (rs.next()) {
            order.add(new OrderedItem(rs.getString(1), rs.getInt(2)));
        }
        return order;
    }
    
    public LinkedList<Product> getAllProducts() throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select ProductID, Name, Stock, Description, CategoryID, Brand, Price from product";
        ResultSet rs = st.executeQuery(query);
        LinkedList<Product> allProducts = new LinkedList<>();
        
        while (rs.next()) {
            allProducts.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDouble(7)));
        }
        return allProducts;
    }
    
    public Product getProduct(int productID) throws SQLException {
        String query = "select ProductID, Name, Stock, Description, CategoryID, Brand, Price from product where productid = " + productID;
        ResultSet rs = st.executeQuery(query);
        Product product = null;
        
        while (rs.next()) { //can only have 1 row
            product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDouble(7));
        }
        return product;
    }
    
    public int nextOrderID() throws SQLException {
        String query = "select max(orderID) from \"ORDER\"";
        ResultSet rs = st.executeQuery(query);
        int maxID = 0;
        while (rs.next()) { //can only have 1 row
            maxID = rs.getInt(1);
        }
        return maxID + 1;
    }
    
    public double priceCart(Cart cart) throws SQLException {
        double totalPrice = 0;
        double price;
        String query;
        for (CartItem item : cart.getCart()) {
            price = 0;
            query = "select price from product where productid = " + item.getProductID();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) { //can only have 1 row
                price = rs.getDouble(1);
            }
            totalPrice += price * item.getQuantity();
        }
        return totalPrice;
    }
    
    public void createOrder(int orderID, int customerID, String status, double totalPrice, boolean paid) throws SQLException  {
        //feature 3 is not yet concerned with payment and addresses; address by features 4 and 5
        //###consider anonymous users
        String query = "insert into \"ORDER\" (OrderID, CustomerID, Status, TotalPrice, Paid) VALUES (" + orderID + ", " + customerID + ", '" + status + "', " + totalPrice + ", '" + paid + "')";
        executeUpdate(query);
    }
    
    private int nextOrderLineID() throws SQLException {
        String query = "select max(OrderLineID) from OrderLineItem";
        ResultSet rs = st.executeQuery(query);
        int maxID = 0;
        while (rs.next()) { //can only have 1 row
            maxID = rs.getInt(1);
        }
        return maxID + 1;
    }
    
    public void createOrderLines(Cart cart, int orderID) throws SQLException {
        int nextID = nextOrderLineID();
        String query;
        for (CartItem item : cart.getCart()) {
            query = "insert into orderlineitem (orderlineid, orderid, productid, quantity) values (" + nextID + ", " + orderID + ", " + item.getProductID() + ", " + item.getQuantity() + ")";
            executeUpdate(query);
            nextID++;
        }
    }
    
    public void reduceStockFromOrder(Cart cart) throws SQLException {
        String query;
        for (CartItem item : cart.getCart()) {
            query = "update product set stock = stock - " + item.getQuantity() + " where productid = " + item.getProductID();
            executeUpdate(query);
        }
    }
    
    public LinkedList<Order> getSavedOrders(int customerID) throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FullfilledBy, AddressID, Address, PaymentID, Paid, DatePaid from \"ORDER\" where status = 'Saved' and customerID = " + customerID; //order is keyword in SQL so needs to be 'stringed'
        ResultSet rs = st.executeQuery(query);
        LinkedList<Order> orders = new LinkedList<>();
        
        while (rs.next()) {
            orders.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11), rs.getDate(12)));
        }
        return orders;
    }
    
    public void submitOrder(int orderID, Date dateSubmitted) throws SQLException {
        String query = "update \"ORDER\" set status = 'Submitted', ordereddate = '" + dateSubmitted.toString() + "' where orderid = " + orderID;
        executeUpdate(query);
    }
    
    public void saveOrder(int orderID, int paymentID, int addressID, String address) throws SQLException {
        //an order either uses an addressid OR an ad-hoc address
        String query = "update \"ORDER\" set paymentID = " + paymentID + ", " + ((addressID == -1) ? ("address = '" + address + "', addressid = null") : ("addressid = " + addressID + ", address = null")) + " where orderid = " + orderID;
        executeUpdate(query);
    }

    public void cancelOrder(int orderID) throws SQLException {
        String query = "update \"ORDER\" set status = 'Cancelled' where orderid = " + orderID;
        executeUpdate(query);
    }

    public void increaseStockFromCancelledOrder(int orderID) throws SQLException {
        LinkedList<CartItem> orderItems = new LinkedList<>();
        String query = "select orderlineitem.productid, name, quantity from orderlineitem inner join product on product.productid = orderlineitem.productid where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        
        while (rs.next()) {
            orderItems.add(new CartItem(rs.getInt(1), rs.getString(2), rs.getInt(3)));
        }
        //get all items from the order
        
        for (CartItem item : orderItems) {
            query = "update product set stock = stock + " + item.getQuantity() + " where productid = " + item.getProductID();
            executeUpdate(query);
        }
    }

    public int getPaymentID(int orderID) throws SQLException {
        int paymentID = 0;
        String query = "select paymentID from \"ORDER\" where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            try {//id may be null
                paymentID = rs.getInt(1);
            } catch (Exception e) {
                paymentID = 0;
            }
        }
        return paymentID;
    }
    
    public int getAddressID(int orderID) throws SQLException {
        int addressID = 0;
        String query = "select addressID from \"ORDER\" where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            try {//id may be null
                addressID = rs.getInt(1);
            } catch (Exception e) {
                addressID = 0;
            }
        }
        return addressID;
    }
    
    public String getAddress(int orderID) throws SQLException {
        String address = "";
        String query = "select address from \"ORDER\" where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            address = rs.getString(1);
        }
        return address;
    }
}