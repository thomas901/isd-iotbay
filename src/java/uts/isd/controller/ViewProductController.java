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
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

public class ViewProductController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        int productID = Integer.parseInt(request.getParameter("productID"));
        
        Product product;
        
        try {
            product = manager.getProduct(productID);
            session.setAttribute("product", product); 
        } catch (SQLException ex) {
            Logger.getLogger(ViewProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("product.jsp").forward(request, response);  
    }
}