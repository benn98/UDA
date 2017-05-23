/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import HibernateConfig.HibernateUtil;
import POJO.Utenti;
import Security.SecurityUtils;
import java.io.Serializable;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author andre
 */
public class UtenteDao {

    public static Utenti checkLogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Integer id = UtenteDao.getIdFromUser(username);
        if(id == null)
            return null;
        Utenti registered = (Utenti) session.get(Utenti.class, id);
       
        if (registered != null && (username.equals(registered.getUsername()) && password.equals(registered.getPassword())))
        {
            return registered;
        }
        return null;
    }

    public static Integer getIdFromUser(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("SELECT U.idUtente FROM Utenti U WHERE U.username =:username");
        q.setParameter("username", username);
        return (Integer) q.list().get(0);
            
    }
     public static Utenti getUser(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("FROM Utenti U WHERE U.username =:username");
        q.setParameter("username", username);
        return (Utenti) q.list().get(0);
            
    }


    public static Utenti doRegistration(String user, String nome, String cognome, String password, String mail, String provincia) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        Utenti utente=null;
        try
        {
            transaction = session.beginTransaction();
            utente =new Utenti(user,nome,cognome,password,mail,provincia);
            session.save(utente);

            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
            return null;
        }finally{
            session.close();
        }
        return utente;
        }

    public static void modificaUtente(Utenti u,String nome,String cognome,String password,String mail,String provincia,String immagine) {
       u.setNome(nome);
       u.setCognome(cognome);
       u.setPassword(password);
       u.setEmail(mail);
       u.setProvincia(provincia);
       u.setImmagine(immagine); 
    }
    
    public static List<Utenti> getListaUtenti(){
        Session session= HibernateUtil.getSessionFactory().openSession();
        List<Utenti> u=session.createQuery("FROM Utenti").list();
        return u;
    }
    }
    
