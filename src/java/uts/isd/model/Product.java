package uts.isd.model;

import java.io.Serializable;

public class Product implements Serializable {
    int productID;
    String name;
    int stock;
    String description;
    int categoryID;
    String brand;
    double price;

    public Product() {
    }

    public Product(int productID, String name, int stock, String description, int categoryID, String brand, double price) {
        this.productID = productID;
        this.name = name;
        this.stock = stock;
        this.description = description;
        this.categoryID = categoryID;
        this.brand = brand;
        this.price = price;
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
