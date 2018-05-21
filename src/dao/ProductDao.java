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
        Session session = factory.openSession();
        Query query = session.createQuery("FROM Product item WHERE item.id_product IN (:ids)");
        query.setParameterList("ids", ids);

        return getProductList(query, session);
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
            return copy(product);
        }finally {
            if(session != null){
                session.close();
            }
        }
    }

    private Product copy(Product product){
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
    }

    public List<Product> getSearchProduct(String search) {
       Session session = factory.openSession();
        Query query = session.createQuery("FROM Product item WHERE item.product_brand like (:search) or item.product_model LIKE (:search)");
        query.setParameter("search", search);
        return getProductList(query, session);
    }

    private List<Product> getProductList(Query query, Session session){
        List<Product> products = new ArrayList<>();
        try {
            session = factory.openSession();

            for(Object product : query.list()){
                products.add(copy((Product) product));
            }
            return products;
        }finally {
            if(session != null){
                session.close();
            }
        }
    }

    public List<Product> getProductsForCategory(String categoryName){
        Session session = factory.openSession();
        Query query = session.createQuery("FROM Product item WHERE item.category.category_name = (:categoryName)");
        query.setParameter("categoryName", categoryName);
        return getProductList(query, session);
    }
}
