package dao;

import model.products.Product;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class ProductDao extends BaseDao<Product> {

    private static ProductDao instance;
    private ProductDao(){
        super();
    }

   public static ProductDao getInstance(){
            if(instance == null){
                instance = new ProductDao();
            }
        return instance;
    }

    public Product getProductById(long id){
        Session session = null;
        try {
            session = factory.openSession();

           return session.get(Product.class, id);
        }finally {
            if(session != null){
                session.close();
            }
        }
    }

    public List<Product> getProductsByIds(List<Long> ids) {
        Session session = null;
        try {
           session = factory.openSession();
           Query query = session.createQuery("FROM Product item WHERE item.id_product IN (:ids)");
           query.setParameterList("ids", ids);
           return query.getResultList();
       }finally {
          if(session != null){
              session.close();
          }
       }
    }
}
