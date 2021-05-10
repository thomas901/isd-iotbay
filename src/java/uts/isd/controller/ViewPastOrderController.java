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
import uts.isd.model.OrderedItem;
import uts.isd.model.dao.DBManager;

public class ViewPastOrderController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //###check user is the same
        
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        LinkedList<OrderedItem> pastOrder;
        
        int orderID = Integer.parseInt(request.getParameter("orderID"));
                
        try {
            pastOrder = manager.getPastOrder(orderID);
            session.setAttribute("pastOrder", pastOrder); 
        } catch (SQLException ex) {
            Logger.getLogger(OrderHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("view_past_order.jsp").forward(request, response);  
    }
}