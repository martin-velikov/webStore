package test;

import model.Category;
import model.User;
import model.orders.Order;
import model.orders.OrderItem;
import model.products.Product;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ManageStudent {
    private static SessionFactory factory;
    public static void main(String[] args) {
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object in Student class." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        ManageStudent MS = new ManageStudent();
        MS.add();
     /* Add few student records in database */

//        MS.add();
//        MS.listStudents();
//       MS.delete(1);

//     /* List down all the students */
//        MS.listStudents();
//
//     /* Update student's records */
//        ME.updateStudent(studentID1, 9.1);
//
//     /* Delete an student from the database */
//        ME.deleteStudent(studentID3);
//
//     /* List down new list of the students */
//        ME.listStudents();
    }

//    public List<String> getCategories() {
//        Session session = factory.openSession();
//        Transaction tx = null;
//        List<String> categoryName = new ArrayList<>();
//
//        try {
//            tx = session.beginTransaction();
//            List categories = session.createQuery("FROM Category").list();
//            for (Iterator iterator =
//                 categories.iterator(); iterator.hasNext(); ) {
//                Category category = (Category) iterator.next();
//                categoryName.add(category.getCategory_name());
//            }
//
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) tx.rollback();
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return categoryName;
//    }


    /* Method to CREATE an student in the database */
    public void add(){
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Product pece = new Product();
            pece.setComputers_cpu("Intel Core I120");
            pece.setComputers_hdd("1TB WD Blue");
            pece.setProduct_brand("Dell");
            pece.setProduct_price(200.99);

            pece.setCategory(session.get(Category.class, Long.valueOf(2)));

            Order order = new Order();
            OrderItem orderItem = new OrderItem();
            User user = new User();
            user.setEmail("ivanskimeil@meil.me");
            order.setUser(user);
            List<OrderItem> orderItems = new ArrayList<>();
            orderItems.add(orderItem);
            order.setOrderItems(orderItems);
            orderItem.setProduct(pece);

            session.save(user);
            session.save(pece);
            session.save(order);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
    /* Method to  READ all the students */
    public void listStudents( ){
        Session session = factory.openSession();
        Transaction tx = null;
        try{

            tx = session.beginTransaction();
            List computers = session.createQuery("FROM Product ").list();
            for (Iterator iterator =
                 computers.iterator(); iterator.hasNext();){
                Product pece = (Product) iterator.next();
                System.out.print("CPU: " + pece.getComputers_cpu());
                System.out.print("  HDD: " + pece.getComputers_hdd());
                System.out.println("  Category: " + pece.getCategory().getCategory_name());
                System.out.println("  Brand: " + pece.getProduct_brand());
                System.out.println("  Price: " + pece.getProduct_price());
            }
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public void addOrderItem() {
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            OrderItem orderItem = new OrderItem();


        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }

    }
//    /* Method to UPDATE grade for a student */
//    public void updateStudent(Integer studentID, float grade ){
//        Session session = factory.openSession();
//        Transaction tx = null;
//        try{
//            tx = session.beginTransaction();
//            Student student =
//                    (Student) session.get(Student.class, studentID);
//            student.setGrade( grade );
//            session.update(student);
//            tx.commit();
//        }catch (HibernateException e) {
//            if (tx!=null) tx.rollback();
//            e.printStackTrace();
//        }finally {
//            session.close();
//        }
//    }
    /* Method to DELETE an student from the records */
    public void delete(long id){
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Product pece = session.get(Product.class, id);
            session.delete(pece);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
}