package dao;

import model.Category;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryDao extends BaseDao<Category> {

    private static SessionFactory factory;

    private static CategoryDao instance;
    private CategoryDao(){}

    public static CategoryDao getInstance(){
        if(instance == null){
            instance = new CategoryDao();
            factory = new Configuration().configure().buildSessionFactory();
        }
        return instance;
    }

    public Category getCategory(String name) {
        try (Session session = factory.openSession()) {
            Query query = session.createQuery("from Category where category_name = :name");
            query.setParameter("name", name);
            List categories = query.list();
            return (Category) categories.get(0);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }
}
