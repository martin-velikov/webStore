package dao;

import model.User;
import org.hibernate.Session;
import org.hibernate.query.Query;

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

    public User getUser(String email) {
        Session session = null;
        try {
            session = factory.openSession();
            Query query = session.createQuery("from User as user where user.email = '" + email + "'");
            return (User) query.list().get(0);
        }finally {
            if(session != null){
                session.close();
            }
        }
    }

}
