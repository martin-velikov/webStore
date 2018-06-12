package dao;

import model.orders.Order;

public class OrderDao extends BaseDao<Order> {

    private static OrderDao instance;
    private OrderDao(){
        super();
    }

    public static OrderDao getInstance(){
        if(instance == null){
            instance = new OrderDao();
        }
        return instance;
    }

}
