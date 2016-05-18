/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import com.myapp.struts.SignupForm;
import model.Photo;
import model.TblMember;
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
            org.hibernate.Transaction tx = session.beginTransaction();
            session.save(photo);
            session.flush();
            tx.commit();
          //  session.flush();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            // tx.rollback();
            return false;
        }
    }
}
