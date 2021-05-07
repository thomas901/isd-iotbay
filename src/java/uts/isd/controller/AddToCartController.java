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

public class AddToCartController extends HttpServlet {   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve the current session
        HttpSession session = request.getSession();

        //retrieve the manager instance from session
        DBManager manager = (DBManager)session.getAttribute("manager");
        
        Product product = (Product)session.getAttribute("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String quantityError = null;
        if (quantity < 1 || quantity > product.getStock()) {
            quantityError = "You can only add a quantity of at least 1.\nYou cannot add a larger quantity to cart than is in stock.";
            session.setAttribute("quantityError", quantityError);
        }
        
        if (quantityError == null) {
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }         
    }
}