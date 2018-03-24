package model;

public class Monitor {

    private int id;
    private int idMark;
    private String description;
    private int quantity;
    private float price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdMark() {
        return idMark;
    }

    public void setIdMark(int idMark) {
        this.idMark = idMark;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
