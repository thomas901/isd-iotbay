//not a table in the database
//it represents the joining between orderlineitem and product
package uts.isd.model;

import java.io.Serializable;

public class OrderedItem implements Serializable {
    private String name;
    private int quantity;

    public OrderedItem() {
    }

    public OrderedItem(String name, int quantity) {
        this.name = name;
        this.quantity = quantity;
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
    
}
