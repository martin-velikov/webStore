import model.Category;
import model.products.Product;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

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

     /* Add few student records in database */
        MS.add();
        MS.listStudents();
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
    /* Method to CREATE an student in the database */
    public void add(){
        Session session = factory.openSession();
        Transaction tx = null;
        Integer studentID = null;
        try{
            tx = session.beginTransaction();
            Product pece = new Product();
            pece.setComputers_cpu("Intel Core I120");
            pece.setComputers_hdd("1TB WD Blue");
            pece.setProduct_brand("Dell");
            pece.setProduct_price(200.99);

            pece.setId_category(8);
            session.save(pece);
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