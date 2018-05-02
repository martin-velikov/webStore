package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

abstract class BaseDao<T extends IDProvider> {

    protected SessionFactory factory;

    protected BaseDao() {
        factory = new Configuration().configure().buildSessionFactory();
    }

    public Long insert(T t) {
        Transaction tx = null;
        Long id;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.save(t);
            tx.commit();
            id = t.getId();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return null;
        }
        return id;
    }

    public void delete(Class<T> clazz, long id) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.get(clazz, id));
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<T> getAllEntities(String tableName) {
            try (Session session = factory.openSession()) {
                Query query = session.createQuery("from " + tableName);
                return  query.list();
            } catch (HibernateException e) {
                e.printStackTrace();
            }
            return null;
    }

    public void update(T t) {
        Transaction tx = null;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.update(t);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
