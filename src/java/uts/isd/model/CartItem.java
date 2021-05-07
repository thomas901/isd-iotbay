//not a table in the database
//used to temporarily store the cart in the session
package uts.isd.model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private int productID;
    private String name;
    private int quantity;

    public CartItem() {
    }

    public CartItem(int productID, String name, int quantity) {
        this.productID = productID;
        this.name = name;
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public void addToQuantity(int amount) {
        quantity += amount;
    }
}