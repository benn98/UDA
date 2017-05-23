/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "post")
@NamedQueries({
    @NamedQuery(name = "Post.findAll", query = "SELECT p FROM Post p")
    , @NamedQuery(name = "Post.findByIdPost", query = "SELECT p FROM Post p WHERE p.idPost = :idPost")
    , @NamedQuery(name = "Post.findByCommento", query = "SELECT p FROM Post p WHERE p.commento = :commento")
    , @NamedQuery(name = "Post.findByVoto", query = "SELECT p FROM Post p WHERE p.voto = :voto")
    , @NamedQuery(name = "Post.findByData", query = "SELECT p FROM Post p WHERE p.data = :data")})
public class Post implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idPost")
    private Integer idPost;
    @Size(max = 250)
    @Column(name = "commento")
    private String commento;
    @Column(name = "voto")
    private Integer voto;
    @Column(name = "data")
    @Temporal(TemporalType.DATE)
    private Date data;
    @JoinColumn(name = "utente", referencedColumnName = "idUtente")
    @ManyToOne(fetch = FetchType.EAGER)
    private Utenti utente;
    @JoinColumn(name = "evento", referencedColumnName = "idEvento")
    @ManyToOne(fetch = FetchType.EAGER)
    private Eventi evento;

    public Post() {
    }

    public Post(Integer idPost) {
        this.idPost = idPost;
    }

     public Post(String commento, Integer rating, Date date, Utenti u, Eventi e) {
        this.commento=commento;
        this.voto=rating;
        this.data=date;
        this.utente=u;
        this.evento=e;
    }

    public Integer getIdPost() {
        return idPost;
    }

    public void setIdPost(Integer idPost) {
        this.idPost = idPost;
    }

    public String getCommento() {
        return commento;
    }

    public void setCommento(String commento) {
        this.commento = commento;
    }

    public Integer getVoto() {
        return voto;
    }

    public void setVoto(Integer voto) {
        this.voto = voto;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Utenti getUtente() {
        return utente;
    }

    public void setUtente(Utenti utente) {
        this.utente = utente;
    }

    public Eventi getEvento() {
        return evento;
    }

    public void setEvento(Eventi evento) {
        this.evento = evento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPost != null ? idPost.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.idPost == null && other.idPost != null) || (this.idPost != null && !this.idPost.equals(other.idPost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJO.Post[ idPost=" + idPost + " ]";
    }
    
}
