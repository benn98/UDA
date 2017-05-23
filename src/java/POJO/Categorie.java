/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "categorie")
@NamedQueries({
    @NamedQuery(name = "Categorie.findAll", query = "SELECT c FROM Categorie c")
    , @NamedQuery(name = "Categorie.findByIdCategoria", query = "SELECT c FROM Categorie c WHERE c.idCategoria = :idCategoria")
    , @NamedQuery(name = "Categorie.findByNome", query = "SELECT c FROM Categorie c WHERE c.nome = :nome")
    , @NamedQuery(name = "Categorie.findByImmagine", query = "SELECT c FROM Categorie c WHERE c.immagine = :immagine")})
public class Categorie implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idCategoria")
    private Integer idCategoria;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nome")
    private String nome;
    @Size(max = 100)
    @Column(name = "immagine")
    private String immagine;
    @ManyToMany(mappedBy = "categorieList", fetch = FetchType.EAGER)
    private List<Utenti> utentiList;
    @OneToMany(mappedBy = "categoria", fetch = FetchType.EAGER)
    private List<Eventi> eventiList;

    public Categorie() {
    }

    public Categorie(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Categorie(Integer idCategoria, String nome, String immagine) {
        this.idCategoria = idCategoria;
        this.nome = nome;
        this.immagine = immagine;
    }
    
    public Categorie(Integer idCategoria, String nome) {
        this.idCategoria = idCategoria;
        this.nome = nome;
    }

    public Categorie(String nome, String immagine) {
        this.nome=nome;
        this.immagine=immagine;
    }

    public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public List<Utenti> getUtentiList() {
        return utentiList;
    }

    public void setUtentiList(List<Utenti> utentiList) {
        this.utentiList = utentiList;
    }

    public List<Eventi> getEventiList() {
        return eventiList;
    }

    public void setEventiList(List<Eventi> eventiList) {
        this.eventiList = eventiList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCategoria != null ? idCategoria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categorie)) {
            return false;
        }
        Categorie other = (Categorie) object;
        if ((this.idCategoria == null && other.idCategoria != null) || (this.idCategoria != null && !this.idCategoria.equals(other.idCategoria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJO.Categorie[ idCategoria=" + idCategoria + " ]";
    }
    
}
