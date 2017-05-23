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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "artisti")
@NamedQueries({
    @NamedQuery(name = "Artisti.findAll", query = "SELECT a FROM Artisti a")
    , @NamedQuery(name = "Artisti.findByIdArtista", query = "SELECT a FROM Artisti a WHERE a.idArtista = :idArtista")
    , @NamedQuery(name = "Artisti.findByNome", query = "SELECT a FROM Artisti a WHERE a.nome = :nome")
    , @NamedQuery(name = "Artisti.findByImmagine", query = "SELECT a FROM Artisti a WHERE a.immagine = :immagine")})
public class Artisti implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idArtista")
    private Integer idArtista;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nome")
    private String nome;
    @Size(max = 100)
    @Column(name = "immagine")
    private String immagine;
    @JoinTable(name = "art_ev", joinColumns = {
        @JoinColumn(name = "idA", referencedColumnName = "idArtista")}, inverseJoinColumns = {
        @JoinColumn(name = "idE", referencedColumnName = "idEvento")})
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Eventi> eventiList;

    public Artisti() {
    }

    public Artisti(Integer idArtista) {
        this.idArtista = idArtista;
    }
         public Artisti(String artista) {
        this.nome = artista;
    }

    public Artisti(Integer idArtista, String nome, String immagine) {
        this.idArtista = idArtista;
        this.nome = nome;
        this.immagine = immagine;
    }


    public Artisti(String nome,String immagine) {
        this.nome = nome;
        this.immagine=immagine;
    }

    public Integer getIdArtista() {
        return idArtista;
    }

    public void setIdArtista(Integer idArtista) {
        this.idArtista = idArtista;
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

    public List<Eventi> getEventiList() {
        return eventiList;
    }

    public void setEventiList(List<Eventi> eventiList) {
        this.eventiList = eventiList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idArtista != null ? idArtista.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Artisti)) {
            return false;
        }
        Artisti other = (Artisti) object;
        if ((this.idArtista == null && other.idArtista != null) || (this.idArtista != null && !this.idArtista.equals(other.idArtista))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJO.Artisti[ idArtista=" + idArtista + " ]";
    }
    
}
