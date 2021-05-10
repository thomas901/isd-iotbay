package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Cart;
import uts.isd.model.Customer;

public class RemoveFromCartController extends HttpServlet {   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get is called when visiting for the first time
        
        //retrieve the current session
        HttpSession session = request.getSession();

        Cart cart = (Cart)session.getAttribute("cart");
        cart.removeFromCart(Integer.parseInt(request.getParameter("productID")));

        request.getRequestDispatcher("cart.jsp").forward(request, response);
        
    }
}