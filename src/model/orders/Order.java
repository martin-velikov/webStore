package model.orders;

import dao.IDProvider;
import model.User;

import java.util.Date;
import java.util.List;

public class Order implements IDProvider {
    private long id_order;
    private Date date;
    private String status;
    private List<OrderItem> orderItems;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId_order() {
        return id_order;
    }

    public void setId_order(long id_order) {
        this.id_order = id_order;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Override
    public Long getId() {
        return id_order == 0 ? null : id_order;
    }
}
