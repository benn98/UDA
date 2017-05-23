/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Spring;

import DAO.ArtistaDao;
import DAO.CategoriaDao;
import DAO.EventoDao;
import DAO.PostDao;
import DAO.UtenteDao;
import POJO.Artisti;
import POJO.Categorie;
import POJO.Eventi;
import POJO.Post;
import POJO.Utenti;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
    
    public MainController(){
        
    }
    
    //<editor-fold defaultstate="collapsed" desc="Home">
    @RequestMapping( value = "/")
    public String index(ModelMap map){
        map.put("eventi", EventoDao.nextEventi());
        return "index";
    }
    //</editor-fold> 
    
    //<editor-fold defaultstate="collapsed" desc="Login">
    @RequestMapping( value ="/login")
    public String login(){
        return "login";    
    }
    
    @RequestMapping( value="/login", params={"username","password"}, method= RequestMethod.POST)
    public String login(ModelMap map, HttpServletRequest request, @RequestParam(value="username") String username,@RequestParam(value="password") String password){
       Utenti user=UtenteDao.checkLogin(username,password);
       if (user !=null){
           request.getSession().setAttribute("userinfo", user);
           return "redirect:/profile";
       }
       else{
           String loginFail="Le tue credenziali sono errate riprova";
           request.getSession().setAttribute("fail", loginFail );
           return "redirect:/login";
       }
           
    }
    
    
    @RequestMapping(value = "/doLogout")
    public String doLogout(ModelMap map, HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        session.setAttribute("username", null);
        session.invalidate();
        return "redirect:./";
    }
    //</editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="Registrazione">    
    @RequestMapping( value="/register")
    public String register(){
        return "register";
    }
    
    @RequestMapping( value="/register", params={"username","nome","cognome","password","repassword","mail","provincia"}, method= RequestMethod.POST)
    public String register(ModelMap map, HttpServletRequest request,@RequestParam(value="username")String user,@RequestParam(value="nome")String nome,@RequestParam(value="cognome")String cognome,@RequestParam(value="password")String password,@RequestParam(value="repassword")String repassword,@RequestParam(value="mail") String mail,@RequestParam(value="provincia")String provincia){
        String fail="credenziali errate";
        String failPsw="Le due password non corrispondono";
        if(!password.equals(repassword)){
           request.getSession().setAttribute("failPsw",failPsw );
           return "redirect:/register";}
        
       Utenti utente=UtenteDao.doRegistration(user,nome,cognome,password,mail,provincia);
       if(utente!=null){
          request.getSession().setAttribute("userinfo", utente);
            return "redirect:/profile";}
       else{
           request.getSession().setAttribute("fail", fail);
           return "redirect:/register";
       }
    }
    //</editor-fold>   
    
    // <editor-fold defaultstate="collapsed" desc="Eventi">  
    @RequestMapping( value="/eventi")
    public String eventi(ModelMap map){
        map.put("eventi", EventoDao.nextEventi());
        return "eventi";
    }
    @RequestMapping( value="/eventStory")
    public String eventStory(ModelMap map){
        map.put("eventi", EventoDao.getEventi());
        return "eventStory";
    }
    //</editor-fold>
        
    //<editor-fold defaultstate="collapsed" desc="Evento">  
     @RequestMapping(value = "/evento", method = RequestMethod.GET)
    public String eventDetail(ModelMap map, @RequestParam(value = "id") String id)
    {
        Eventi evento = EventoDao.retrieveSingle(id);
        List<Post> posts = PostDao.getEventoPost(evento.getIdEvento());
        map.put("evento", evento);
        map.put("post", posts);
        map.put("votoMedio", EventoDao.getVotoMedio(id));
        map.put("artisti",evento.getArtistiList());
     return "evento";  
    }
    //</editor-fold>
  
    // <editor-fold defaultstate="collapsed" desc="Utente">
    @RequestMapping( value="/profile")
    public String profile(ModelMap map,HttpServletRequest request){
        Utenti u=(Utenti) request.getSession().getAttribute("userinfo");
        map.put("eventi", EventoDao.getUserEventi(u));
        return "profile";
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Categorie">
    @RequestMapping(value="/categorie")
    public String categorie(ModelMap map,HttpServletRequest request){
        map.put("categorie", CategoriaDao.getListaCategorie());
        if(request.getSession().getAttribute("userinfo")==null){}
        else{
            Utenti u=(Utenti) request.getSession().getAttribute("userinfo");
            map.put("categorieUtente",u.getCategorieList());}
        return "categorie";
    }
    
    @RequestMapping(value="/iscrivitiCat", params={"cat"}, method = RequestMethod.GET)
    public String iscrizione(ModelMap map,@RequestParam("cat") String cat,HttpServletRequest request){
        map.put("check",CategoriaDao.iscrizione(cat,request));
        map.put("categorie", CategoriaDao.getListaCategorie());
        return "categorie";
    }
    //</editor-fold>

    // <editor-fold defaultstate="collapsed" desc="Artisti">
    @RequestMapping(value="/artisti")
    public String artisti(ModelMap map){
        map.put("artisti", ArtistaDao.getListaArtisti());
        return "artisti";
    }
    
    @RequestMapping(value="/addOrNewArtista", params={"id"},method= RequestMethod.GET)
    public String AddartistaEvento(ModelMap map,@RequestParam("id")String id){
        map.put("artisti",ArtistaDao.getListaArtisti());
        map.put("idEvento",id);
        return "addOrNewArtista";
    }
    @RequestMapping(value="/addArtista", params={"id","nome","immagine"},method= RequestMethod.POST)
    public String AddartistaEvento(ModelMap map,@RequestParam("id")String id,@RequestParam("nome")String nome,@RequestParam("immagine")String immagine){
        ArtistaDao.addArtista(nome,immagine,id);
        return "redirect:/evento?id="+id;
    }
    @RequestMapping(value="/inserisciArtista", params={"id","nome"},method= RequestMethod.POST)
    public String inserisciArtistaEvento(ModelMap map,@RequestParam("id")String id,@RequestParam("nome")String nome){
        ArtistaDao.checkCreateArtista(id,nome);
        return "redirect:/evento?id="+id;
    }
    //</editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Commenti">
    @RequestMapping(value="/newComment", params={"comment","rating","id"},method= RequestMethod.POST)
    public String newCommento(HttpServletRequest request,@RequestParam(value="comment")String commento,@RequestParam(value="rating")String rating,@RequestParam(value="id") String id){
        HttpSession session = request.getSession();
        Utenti u= (Utenti) session.getAttribute("userinfo");
        if(rating.equals("0"))
        PostDao.newPost(u.getIdUtente(),0,commento,Integer.parseInt(id));    
        PostDao.newPost(u.getIdUtente(),Integer.parseInt(rating),commento,Integer.parseInt(id));
    return "redirect:/evento?id="+id;   
    }
    //</editor-fold>
    
    // <editor-fold defaultstate="collapsed" desc="Nuovo Evento">
    @RequestMapping(value="/newEvento")
    public String newEvento(ModelMap map){
        map.put("categorie",CategoriaDao.getListaCategorie());
        return "newEvento";
    }

    @RequestMapping(value="/new",params={"titolo","data","luogo","orario","categoria","descrizione","provincia","immagine"}, method= RequestMethod.POST)
    public String newEvento(@RequestParam(value="titolo")String titolo,@RequestParam(value="data")String data,@RequestParam(value="luogo")String luogo,@RequestParam(value="orario")String orario,@RequestParam(value="categoria")String categoria,@RequestParam(value="descrizione")String descrizione,@RequestParam(value="provincia")String provincia,@RequestParam("immagine")String immagine) throws ParseException{
       
        Categorie cat=CategoriaDao.getCategoria(categoria);
        DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.SHORT, Locale.ITALY);
        Eventi evento=EventoDao.NewEvento(titolo,dateFormat.parse(data),luogo,provincia,orario,cat,descrizione,immagine);
        if(evento==null)
            return "redirect:/newEvento";
        else
        return "redirect:/addOrNewArtista?id="+evento.getIdEvento();
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Impostazione utente">
    @RequestMapping(value="/impostazioniUtente")
    public String impostazioniUtente(){
        return "impostazioniUtente";
    }
    @RequestMapping( value="/impostazioniUtente", params={"nome","cognome","password","repassword","mail","provincia","immagine"}, method= RequestMethod.POST)
    public String impostazioni(ModelMap map, HttpServletRequest request,@RequestParam(value="nome")String nome,@RequestParam(value="cognome")String cognome,@RequestParam(value="password")String password,@RequestParam(value="repassword")String repassword,@RequestParam(value="mail") String mail,@RequestParam(value="provincia")String provincia,@RequestParam(value="immagine")String immagine){
        if(password.equals(repassword))
        UtenteDao.modificaUtente((Utenti) request.getSession().getAttribute("userinfo"),nome,cognome,password,mail,provincia,immagine);
        else
            request.getSession().setAttribute("failPsw", "password non corrispondono");
        return "redirect:/profile";
    }   
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="Amministrazione">
        
        //<editor-fold defaultstate="collapsed" desc="home">
        @RequestMapping(value="/admin")
        public String admin(ModelMap map){
            List<Utenti> u=UtenteDao.getListaUtenti();
            map.put("utentiList",u);
            return "admin";
        }
        //</editor-fold>
        
        //<editor-fold defaultstate="collapsed" desc="lista">
        @RequestMapping(value="/list", params={"type"}, method =RequestMethod.GET)
        public String lista(ModelMap map,@RequestParam("type")String type){
           if(type.equals("eventi"))
               map.put("lista",EventoDao.getEventi());
           else
               if(type.equals("artisti"))
                   map.put("lista",ArtistaDao.getListaArtisti());
               else
                   map.put("lista",CategoriaDao.getListaCategorie());
           map.put("type",type);
           return "list";
        }
        //</editor-fold>
        
        //<editor-fold defaultstate="collapsed" desc="elimina">
        @RequestMapping(value="/removeEvento",params={"id"},method=RequestMethod.GET)
        public String removeEvento(@RequestParam("id")String id){
            boolean check=EventoDao.removeEvento(id);
           
                return "redirect:/list?type=eventi";
        }
        @RequestMapping(value="/removeArtista",params={"id"},method=RequestMethod.GET)
        public String removeArtista(@RequestParam("id")String id){
            boolean check=ArtistaDao.removeArtista(id);
            
                return "redirect:/list?type=artisti";
        }
        @RequestMapping(value="/removeCategoria",params={"id"},method=RequestMethod.GET)
        public String removeCategoria(@RequestParam("id")String id){
            boolean check=CategoriaDao.removeCategoria(id);
           
                return "redirect:/list?type=categorie";
        }
        //</editor-fold>
        
        //<editor-fold defaultstate="collapsed" desc="aggiungi">
        @RequestMapping(value="/aggiungi",params={"type"},method=RequestMethod.GET)
        public String aggiungi(ModelMap map,@RequestParam("type")String type){
          map.put("type",type);
          map.put("categorie",CategoriaDao.getListaCategorie());
          return "aggiungi";
        }
        
        @RequestMapping(value="/newArtista", params={"nome","immagine"},method= RequestMethod.POST)
    public String newArtista(ModelMap map,@RequestParam("nome")String nome,@RequestParam("immagine")String immagine){
        Artisti a=ArtistaDao.addNewArtista(nome,immagine);
        if(a==null)
            return "redirect:/aggiungi?type=artisti";
        return "redirect:/artisti";
    }
         @RequestMapping(value="/newCategoria", params={"nome","immagine"},method= RequestMethod.POST)
    public String newCategoria(ModelMap map,@RequestParam("nome")String nome,@RequestParam("immagine")String immagine){
        Categorie c=CategoriaDao.addNewCategoria(nome,immagine);
        if(c==null)
            return "redirect:/aggiungi?type=categorie";
        return "redirect:/categorie";
    }
    
        //</editor-fold>
    
    //</editor-fold>
}

