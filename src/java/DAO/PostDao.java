/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import HibernateConfig.HibernateUtil;
import POJO.Eventi;
import POJO.Post;
import POJO.Utenti;
import java.time.Instant;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author andre
 */
public class PostDao {

    public static List<Post> getEventoPost(Integer idEvento) {
       Session session = HibernateUtil.getSessionFactory().openSession();
       return session.createQuery("FROM Post WHERE evento="+idEvento).list();
    }

    public static void newPost(Integer idUtente,Integer rating,String commento,Integer idEvento) {
         Session session = HibernateUtil.getSessionFactory().openSession();
         Transaction transaction = null;
         Utenti u= (Utenti) session.get(Utenti.class,idUtente);
         Eventi e=(Eventi) session.get(Eventi.class, idEvento);
         try{
             transaction = session.beginTransaction();
             session.save(new Post(commento,rating,(Date) Calendar.getInstance().getTime(),u,e));
             transaction.commit();
         }catch(HibernateException ex){
             transaction.rollback();
         }
    }
    
}
