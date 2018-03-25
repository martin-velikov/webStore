package model.orders;

import model.products.Product;


public class OrderItem {
    private long id_order_items;
    private Product product;
    private int quantity;

    public long getId_order_items() {
        return id_order_items;
    }

    public void setId_order_items(long id_order_items) {
        this.id_order_items = id_order_items;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
