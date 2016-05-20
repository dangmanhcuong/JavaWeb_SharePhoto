/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import java.util.ArrayList;
import model.Photo;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Nagato_Pain
 */
public class PhotoHelper {

    Session session = null;

    public PhotoHelper() {
        this.session = LoginHibernateUtil1.getSessionFactory().getCurrentSession();
    }

    public boolean uploadPhoto(Photo photo) {
        try {
            //org.hibernate.Transaction tx = session.beginTransaction();
              org.hibernate.Transaction txD;
            //
            if (session.getTransaction() != null
                    && session.getTransaction().isActive()) {
                txD = session.getTransaction();
            } else {
                txD = session.beginTransaction();
            }
            //
            session.save(photo);
            session.flush();
            txD.commit();
            //  session.flush();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            // tx.rollback();
            return false;
        }
    }

    public ArrayList<Photo> getListPhoto() {
        ArrayList<Photo> listPhoto = new ArrayList<>();
        //query database
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Photo as Photo ");
            listPhoto = (ArrayList<Photo>) q.list();
            //session.flush();
            //tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //session.beginTransaction().rollback();
            //session.close();
        } finally {
            //
        }
        return listPhoto;
    }
    public ArrayList<Photo> getListPhotoByMember(Integer idMember){
        ArrayList<Photo> listPhoto = new ArrayList<>();
         //query database
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Photo as Photo where Photo.idMember ='"+idMember+"'");
            listPhoto = (ArrayList<Photo>) q.list();
            //session.flush();
            //tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //session.beginTransaction().rollback();
            //session.close();
        } finally {
            //
        }
        return listPhoto;
    }
}
