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

public class OrderHistoryController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get is called when visiting for the first time
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        LinkedList<Order> pastOrders;
        
        Customer customer = (Customer)session.getAttribute("customer");        
        try {
            pastOrders = manager.getPastOrders(customer.getCustomerID());
            session.setAttribute("pastOrders", pastOrders); 
        } catch (SQLException ex) {
            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("order_history.jsp").forward(request, response);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //post is called when a filter is applied
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        LinkedList<Order> pastOrders;
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        String startIDInput = request.getParameter("startID");
        String endIDInput = request.getParameter("endID");
                
        //not all values are mandatory; update to what should happen if they are empty:      
        //if none were entered, default to big or small value
        startDate = startDate.isEmpty() ? "0001-01-01" : startDate;
        endDate = endDate.isEmpty() ? "9999-12-31" : endDate;
        startIDInput = startIDInput.isEmpty() ? "0" : startIDInput;
        endIDInput = endIDInput.isEmpty() ? String.valueOf(Integer.MAX_VALUE) : endIDInput;
        
        int startID = Integer.parseInt(startIDInput);
        int endID = Integer.parseInt(endIDInput);

        Customer customer = (Customer)session.getAttribute("customer");        
        try {
            pastOrders = manager.getPastOrders(customer.getCustomerID(), startDate, endDate, startID, endID);
            session.setAttribute("pastOrders", pastOrders); 
        } catch (SQLException ex) {
            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("order_history.jsp").forward(request, response);
        
    }
}