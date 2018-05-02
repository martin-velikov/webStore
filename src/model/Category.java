package model;

import dao.IDProvider;
import model.products.Product;

public class Category implements IDProvider {
    private long id_category;
    private String category_name;
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public long getId_category() {
        return id_category;
    }

    public void setId_category(long id_category) {
        this.id_category = id_category;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    @Override
    public Long getId() {
        return id_category == 0 ? null : id_category;
    }
}
