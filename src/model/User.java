package model;

import dao.IDProvider;
import model.orders.Order;

import java.util.List;

public class User implements IDProvider{
    private long id_users;
    private String email;
    private String password;
    private String first_name;
    private String last_name;
    private String address;
    private String phone;
    private String picture;
    private List<Order> orders;

    public long getId_users() {
        return id_users;
    }

    public void setId_users(long id_users) {
        this.id_users = id_users;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public Long getId() {
        return id_users == 0 ? null : id_users;
    }
}
