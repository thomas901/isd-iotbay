package uts.isd.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;

public class UpdateSavedOrderController extends HttpServlet {   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //an update is either:
        //1. Submitting the order
        //2. Saving the order
        //3. Cancelling the order
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        
        String submit = (String)request.getParameter("submit");
        String save = (String)request.getParameter("save");
        String cancel = (String)request.getParameter("cancel");
        
        try { 
            if (submit != null) { //1. Submitting the order
                Date dateNow = new Date(Calendar.getInstance().getTimeInMillis());
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                manager.submitOrder(orderID, dateNow);
                request.getRequestDispatcher("SavedOrdersController?message=Order Submitted").forward(request, response);
            } else if (save != null) { //2. Saving the order
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                String rawAddressID = (String)request.getParameter("addressID");
                int addressID;
                addressID = rawAddressID.isEmpty() ? -1 : Integer.parseInt(rawAddressID);
                String address = (String)request.getParameter("address");
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                manager.saveOrder(orderID, paymentID, addressID, address);
                request.getRequestDispatcher("SavedOrdersController?message=Order Saved").forward(request, response);
            } else if (cancel != null) { //3. Cancel the order
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                manager.cancelOrder(orderID);
                manager.increaseStockFromCancelledOrder(orderID);
                request.getRequestDispatcher("SavedOrdersController?message=Order Cancelled").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ViewSavedOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
    }
}