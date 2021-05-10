package uts.isd.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Customer;
import uts.isd.model.Order;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class SavedOrdersController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get is called when visiting for the first time
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        LinkedList<Order> savedOrders;
        
        Customer customer = (Customer)session.getAttribute("customer");        
        try {
            savedOrders = manager.getSavedOrders(customer.getCustomerID());
            session.setAttribute("savedOrders", savedOrders); 
        } catch (SQLException ex) {
            Logger.getLogger(SavedOrdersController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("saved_orders.jsp").forward(request, response);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get is called when visiting for the first time
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        LinkedList<Order> savedOrders;
        
        Customer customer = (Customer)session.getAttribute("customer");        
        try {
            savedOrders = manager.getSavedOrders(customer.getCustomerID());
            session.setAttribute("savedOrders", savedOrders); 
        } catch (SQLException ex) {
            Logger.getLogger(SavedOrdersController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String message = (String)request.getParameter("message");
        
        request.getRequestDispatcher("saved_orders.jsp" + ((message == null) ? ("") : ("?message="+message))).forward(request, response);
        
    }
}