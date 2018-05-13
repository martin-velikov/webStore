package dao;

import model.products.Product;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
    public List<Product> getRandomProducts(int count){
        ProductDao productDao = ProductDao.getInstance();
        List<Product> products = productDao.getAllEntities("Product");
        List<Product> randomProducts = new ArrayList<>();
        for (int i=0; i<count; i++) {
            int index;
            boolean shouldAdd;
            do {
                shouldAdd = true;
                index = new Random().nextInt(products.size() - 1);
                Product product = products.get(index);

                for(Product product1 : randomProducts){
                    if(product1.getId().equals(product.getId())){
                        shouldAdd = false;
                    }
                }
                if(shouldAdd){
                    break;
                }
            }
            while (true);

            randomProducts.add(products.get(index));
        }
        return randomProducts;
    }
}
