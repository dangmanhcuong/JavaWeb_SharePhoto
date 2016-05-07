/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import model.Member;
import java.util.ArrayList;
import java.util.List;
import model.TblMember;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nagato_Pain
 */
public class LoginService {
    TblMemberHelper helper;
    public LoginService(){
        this.helper = new TblMemberHelper();
    }

    public boolean authenticateUser(String nickname, String password) {
        Member member = getMemberByNickName(nickname);
        TblMember member1 = helper.getMemberByNickname("cuong");
        if ((member1 != null)) {
            return true;
        } else {
            return false;
        }
    }

    public Member getMemberByNickName(String nickname) {
        Session session = NewHibernateUtil.openSession();
        Transaction tx = null;
        Member member = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery(" from TblMember");
            member = (Member) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return member;
    }

    public List<Member> getListOfMember() {
        List<Member> list = new ArrayList<Member>();
        Session session = NewHibernateUtil.openSession();
        Transaction tx = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from tbl_member").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
