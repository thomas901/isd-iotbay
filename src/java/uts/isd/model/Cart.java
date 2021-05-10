//not a table in the database
//used to temporarily store the cart in the session
package uts.isd.model;

import java.io.Serializable;
import java.util.LinkedList;

public class Cart implements Serializable {
    private LinkedList<CartItem> cart;

    public Cart() {
        cart = new LinkedList<>();
    }
    
    private int getProductIndex(int productID) {
        int count = 0;
        for (CartItem item : cart) {
            if (item.getProductID() == productID) {
                return count;
            }
            count++;
        }
        return -1;
    }
    
    public int quantityOf(int productID) {
        int index = getProductIndex(productID);
        if (index == -1) {
            return 0;
        } else {
            return cart.get(index).getQuantity();
        }
    }
    
    public void addToCart(int productID, String name, int quantity) {
        int index = getProductIndex(productID);
        if (index == -1) {
            cart.add(new CartItem(productID, name, quantity));
        } else {
            cart.get(index).addToQuantity(quantity);
        }
    }
    
    public void clear() {
        cart.clear();
    }
    
    public boolean isEmpty() {
        return cart.isEmpty();
    }

    public LinkedList<CartItem> getCart() {
        return cart;
    }

    public void setCart(LinkedList<CartItem> cart) {
        this.cart = cart;
    }
}