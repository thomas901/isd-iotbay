package uts.isd.model;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    int orderID;
    int customerID;
    Date orderedDate;
    String status;
    Date shippedDate;
    double totalPrice;
    int fullfilledBy;
    int addressID;
    String address;
    int paymentID;
    boolean paid;
    Date datePaid;

    public Order() {
    }

    public Order(int orderID, int customerID, Date orderedDate, String status, Date shippedDate, double totalPrice, int fullfilledBy, int addressID, String address, int paymentID, boolean paid, Date datePaid) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.orderedDate = orderedDate;
        this.status = status;
        this.shippedDate = shippedDate;
        this.totalPrice = totalPrice;
        this.fullfilledBy = fullfilledBy;
        this.addressID = addressID;
        this.address = address;
        this.paymentID = paymentID;
        this.paid = paid;
        this.datePaid = datePaid;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public Date getOrderedDate() {
        return orderedDate;
    }

    public void setOrderedDate(Date orderedDate) {
        this.orderedDate = orderedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getShippedDate() {
        return shippedDate;
    }

    public void setShippedDate(Date shippedDate) {
        this.shippedDate = shippedDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getFullfilledBy() {
        return fullfilledBy;
    }

    public void setFullfilledBy(int fullfilledBy) {
        this.fullfilledBy = fullfilledBy;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
    }

    public Date getDatePaid() {
        return datePaid;
    }

    public void setDatePaid(Date datePaid) {
        this.datePaid = datePaid;
    }
}
