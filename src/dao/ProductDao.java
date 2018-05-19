package dao;

import model.Category;
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

    public Product getProductCopy(long id){
        Session session = null;
        try {
            session = factory.openSession();
            Product product = session.get(Product.class, id);
            Product newProcuct = new Product();
            newProcuct.setId_product(product.getId_product());
            newProcuct.setProduct_brand(product.getProduct_brand());
            newProcuct.setProduct_model(product.getProduct_model());
            newProcuct.setProduct_description(product.getProduct_description());
            newProcuct.setProduct_price(product.getProduct_price());
            Category category = new Category();
            category.setCategory_name(product.getCategory().getCategory_name());
            newProcuct.setCategory(category);
            return newProcuct;
        }finally {
            if(session != null){
                session.close();
            }
        }
    }
}
