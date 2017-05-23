/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import HibernateConfig.HibernateUtil;
import POJO.Categorie;
import POJO.Eventi;
import POJO.Utenti;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author andre
 */
public class CategoriaDao {
    
    public static List<Categorie> getListaCategorie(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        List<Categorie> categorie= session.createQuery("from Categorie").list();
        
        return categorie;
    }
    public static Categorie getCategoria(String categoria){
       Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("FROM Categorie C WHERE C.nome =:nome");
        q.setParameter("nome", categoria);
        return (Categorie) q.list().get(0); 
    }

    public static String iscrizione(String id,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Session session2 = HibernateUtil.getSessionFactory().openSession();
        Utenti u= (Utenti) session.getAttribute("userinfo");
        boolean check=false;
        int id2=Integer.parseInt(id);
        for(Categorie c:u.getCategorieList())
            if(c.getIdCategoria()==id2)
                check=true;
        if(check==true)
            return "categoria già scelta";
        else
            u.addCategoria((Categorie)session2.get(Categorie.class,id2));
        return "categoria aggiunta alle tue preferenze";
    }   

    public static Categorie addNewCategoria(String nome, String immagine) {
Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Categorie c=new Categorie(nome,immagine);
        try
        {
            transaction = session.beginTransaction();
            session.save(c);

            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            return null;
        } finally
        {
            session.close();
            return c;
        }
       
        }

    public static boolean removeCategoria(String id) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        
        try
        {
            transaction = session.beginTransaction();
            Query q=session.createQuery("SELECT FROM Eventi WHERE categoria=:cat");
            q.setParameter("cat", (Categorie)session.get(Categorie.class,Integer.parseInt(id)));
            List<Eventi> e=q.list();
            for(Eventi ev:e){
            q = session.createQuery("DELETE FROM Post WHERE evento= :eventID");
            q.setParameter("eventID", ev);
            q.executeUpdate();
            q = session.createQuery("DELETE FROM Eventi WHERE idEvento= :eventID");
            q.setParameter("eventID", ev.getIdEvento());
            q.executeUpdate();
            }
            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            
        } finally
        {
            session.close();
            
        }
         try
        {
            transaction = session.beginTransaction();
            Query q=session.createQuery("DELETE FROM Categorie WHERE idCategoria=:cat");
            q.setParameter("cat", Integer.parseInt(id));
            
            
            q.executeUpdate();
            
            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            return false;
            
        } finally
        {
            session.close();
            return true;
        }
    }
    
    }
