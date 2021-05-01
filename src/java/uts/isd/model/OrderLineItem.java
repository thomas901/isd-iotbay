package uts.isd.model;

import java.io.Serializable;

public class OrderLineItem implements Serializable {
    int orderLineID;
    int orderID;
    int productID;
    int quantity;

    public OrderLineItem() {
    }

    public OrderLineItem(int orderLineID, int orderID, int productID, int quantity) {
        this.orderLineID = orderLineID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public int getOrderLineID() {
        return orderLineID;
    }

    public void setOrderLineID(int orderLineID) {
        this.orderLineID = orderLineID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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
