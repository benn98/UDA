/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import HibernateConfig.HibernateUtil;
import POJO.Artisti;
import POJO.Eventi;
import POJO.Utenti;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author andre
 */
public class ArtistaDao {
    
    public static List<Artisti> getListaArtisti(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        List<Artisti> artisti= session.createQuery("from Artisti").list();
        
        return artisti;
    }

    public static void checkCreateArtista(String id,String artista) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("FROM Artisti A WHERE A.nome =:nome");
        q.setParameter("nome", artista);
        Artisti artist=(Artisti) q.list().get(0);
            Eventi e=(Eventi)session.get(Eventi.class, Integer.parseInt(id));
            e.addArtista(artist);
        
    }   

    public static void addArtista(String nome, String immagine,String id) {
       Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Artisti artista=new Artisti(nome,immagine);
        try
        {
            transaction = session.beginTransaction();
            session.save(artista);
            Eventi e=(Eventi)session.get(Eventi.class,Integer.parseInt(id));
            e.addArtista(artista);

            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            e.printStackTrace();
        } finally
        {
            session.close();
        }
       
    }

    public static Artisti addNewArtista(String nome, String immagine) {
        Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Artisti artista=new Artisti(nome,immagine);
        try
        {
            transaction = session.beginTransaction();
            session.save(artista);

            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            return null;
        } finally
        {
            session.close();
            return artista;
        }
       
    }

    public static boolean removeArtista(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Integer artistaId=Integer.parseInt(id);
        
        try
        {
            transaction = session.beginTransaction();
            Query query = session.createQuery("DELETE FROM Artisti WHERE idArtista = :artistaId");
            query.setParameter("artistaId", artistaId);
            query.executeUpdate();
            
          

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
    
