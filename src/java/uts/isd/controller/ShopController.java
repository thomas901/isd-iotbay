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
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

public class ShopController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        Cart cart = (Cart)session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        LinkedList<Product> allProducts;
        try {
            allProducts = manager.getAllProducts();
            session.setAttribute("allProducts", allProducts); 
        } catch (SQLException ex) {
            Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}