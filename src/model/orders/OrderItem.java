package model.orders;

import dao.IDProvider;
import model.products.Product;


public class OrderItem implements IDProvider {
    private long id_order_items;
    private Product product;
    private int quantity;
    private double price;

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public Long getId() {
        return id_order_items == 0 ? null : id_order_items;
    }
}
