package uts.isd.model;

import java.io.Serializable;

public class CartLineItem implements Serializable {
    int cardLineItemID;
    int customerID;
    int productID;
    int quantity;

    public CartLineItem() {
    }

    public CartLineItem(int cardLineItemID, int customerID, int productID, int quantity) {
        this.cardLineItemID = cardLineItemID;
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public int getCardLineItemID() {
        return cardLineItemID;
    }

    public void setCardLineItemID(int cardLineItemID) {
        this.cardLineItemID = cardLineItemID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
