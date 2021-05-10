package uts.isd.model;

import java.io.Serializable;

public class PaymentMethod implements Serializable {
    int paymentMethodID;
    int customerID;
    int cardNumber;
    int cardExpiryYear;
    int cardExpiryMonth;
    int CVC;

    public PaymentMethod() {
    }

    public PaymentMethod(int paymentMethodID, int customerID, int cardNumber, int cardExpiryYear, int cardExpiryMonth, int CVC) {
        this.paymentMethodID = paymentMethodID;
        this.customerID = customerID;
        this.cardNumber = cardNumber;
        this.cardExpiryYear = cardExpiryYear;
        this.cardExpiryMonth = cardExpiryMonth;
        this.CVC = CVC;
    }

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(int cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getCardExpiryYear() {
        return cardExpiryYear;
    }

    public void setCardExpiryYear(int cardExpiryYear) {
        this.cardExpiryYear = cardExpiryYear;
    }

    public int getCardExpiryMonth() {
        return cardExpiryMonth;
    }

    public void setCardExpiryMonth(int cardExpiryMonth) {
        this.cardExpiryMonth = cardExpiryMonth;
    }

    public int getCVC() {
        return CVC;
    }

    public void setCVC(int CVC) {
        this.CVC = CVC;
    }
}
