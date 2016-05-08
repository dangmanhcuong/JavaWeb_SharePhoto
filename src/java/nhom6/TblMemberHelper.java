/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import model.TblMember;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Nagato_Pain
 */
public class TblMemberHelper {

    Session session = null;

    public TblMemberHelper() {
        this.session = LoginHibernateUtil1.getSessionFactory().getCurrentSession();
    }

    public TblMember getMemberByNickname(String nickname, String passwork) {

        TblMember member = null;

        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TblMember as TblMember  where TblMember.nickname= '" + nickname + "'"+"and TblMember.passwork = '"+passwork+"'");
            member = (TblMember) q.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return member;
    }

}
