package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Cart;
import uts.isd.model.Customer;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

public class CheckoutController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        Customer customer = (Customer)session.getAttribute("customer");
        Cart cart = (Cart)session.getAttribute("cart");
        //upon checking out a cart, a few things happen
        try {
            int orderID = manager.nextOrderID();
            double totalPrice = manager.priceCart(cart);
            manager.createOrder(orderID, customer == null ? null : customer.getCustomerID(), "Saved", totalPrice, false);
            manager.createOrderLines(cart, orderID);
            manager.reduceStockFromOrder(cart);
            cart.clear();
            request.getRequestDispatcher("ViewSavedOrderController?orderID=" + orderID).forward(request, response);     
        } catch (SQLException ex) {
            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}