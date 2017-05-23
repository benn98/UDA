/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import HibernateConfig.HibernateUtil;
import POJO.Artisti;
import POJO.Categorie;
import POJO.Eventi;
import POJO.Post;
import POJO.Utenti;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author andre
 */

public class EventoDao {
    
    public static List<Eventi> getEventi(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        List<Eventi> eventi= session.createQuery("from Eventi ORDER BY data,titolo").list();
        
        return eventi;
    }
    
    public static List<Eventi> nextEventi(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        List<Eventi> eventi= session.createQuery("from Eventi WHERE data >= CURDATE() ORDER BY data,titolo").list();
        for(int i=eventi.size();i>=10;i--)
            eventi.remove(i);
        return eventi;
    }
    public static List<Categorie> getUserCategorie(Utenti utente){
        Session session = HibernateUtil.getSessionFactory().openSession();
            UtenteDao.getUser(utente.getUsername());
            List<Categorie> categorie=utente.getCategorieList();
      return categorie;
    }
    public static List<Eventi> getUserEventi(Utenti utente){
        Session session = HibernateUtil.getSessionFactory().openSession();
            Query q = session.createQuery("SELECT DISTINCT C FROM Categorie C JOIN C.utentiList U WHERE U.idUtente=:utente ").setParameter("utente",utente.getIdUtente());
            List<Categorie>categorie=q.list();
            ArrayList<Eventi> eventi=new ArrayList<Eventi>();
            for(Categorie c:categorie)
                eventi.addAll(c.getEventiList());    
        return eventi;
    }

    public static Eventi retrieveSingle(String id) {
         Session session = HibernateUtil.getSessionFactory().openSession();
         Query q = session.createQuery("FROM Eventi E WHERE E.idEvento =:id");
        q.setParameter("id",Integer.parseInt(id));
        return (Eventi) q.list().get(0);    
    }

    public static Eventi NewEvento(String titolo, Date data, String luogo,String provincia,  String orario, Categorie cat, String descrizione,String immagine) {
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction transaction = null;
        Eventi evento=null;
        try
        {
            transaction = session.beginTransaction();
            evento =new Eventi(titolo,data,luogo,provincia,orario,descrizione,cat,immagine);
            session.save(evento);

            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            e.printStackTrace();
            return null;
        } finally
        {
            session.close();
        }
        return evento;
        }
    public static int getVotoMedio(String id){
    Eventi e=EventoDao.retrieveSingle(id);
    List<Post> p=e.getPostList();
    int voto=0;
    for(int i=0;i<p.size();i++){
        voto+=p.get(i).getVoto();
    }
    if (voto!=0)
        voto=voto/p.size();
    else
        voto=0;
    return voto;
    }

  

    public static boolean removeEvento(String id) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Integer eventId=Integer.parseInt(id);
        
        try
        {
            transaction = session.beginTransaction();
            Query query = session.createQuery("DELETE FROM Post WHERE evento = :event");
            query.setParameter("event",(Eventi)session.get(Eventi.class,eventId));
            query.executeUpdate();
            
            query = session.createQuery("DELETE FROM Eventi WHERE id = :eventID");
            query.setParameter("eventID", eventId);
            query.executeUpdate();

            transaction.commit();
        } catch (HibernateException e)
        {
            e.printStackTrace();
            transaction.rollback();
            return false;
        } finally
        {
            session.close();
            return true;
        }
    }
}
