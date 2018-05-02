package dao;

import model.User;

public class UserDao extends BaseDao<User> {

    private static UserDao instance;

    private UserDao() {
        super();
    }

    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }
}
