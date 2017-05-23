/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "eventi")
@NamedQueries({
    @NamedQuery(name = "Eventi.findAll", query = "SELECT e FROM Eventi e")
    , @NamedQuery(name = "Eventi.findByIdEvento", query = "SELECT e FROM Eventi e WHERE e.idEvento = :idEvento")
    , @NamedQuery(name = "Eventi.findByTitolo", query = "SELECT e FROM Eventi e WHERE e.titolo = :titolo")
    , @NamedQuery(name = "Eventi.findByLuogo", query = "SELECT e FROM Eventi e WHERE e.luogo = :luogo")
    , @NamedQuery(name = "Eventi.findByProvincia", query = "SELECT e FROM Eventi e WHERE e.provincia = :provincia")
    , @NamedQuery(name = "Eventi.findByDescrizione", query = "SELECT e FROM Eventi e WHERE e.descrizione = :descrizione")
    , @NamedQuery(name = "Eventi.findByData", query = "SELECT e FROM Eventi e WHERE e.data = :data")
    , @NamedQuery(name = "Eventi.findByOrario", query = "SELECT e FROM Eventi e WHERE e.orario = :orario")
    , @NamedQuery(name = "Eventi.findByImmagine", query = "SELECT e FROM Eventi e WHERE e.immagine = :immagine")})
public class Eventi implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idEvento")
    private Integer idEvento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "titolo")
    private String titolo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "luogo")
    private String luogo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "provincia")
    private String provincia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "descrizione")
    private String descrizione;
    @Basic(optional = false)
    @NotNull
    @Column(name = "data")
    @Temporal(TemporalType.DATE)
    private Date data;
    @Size(max = 11)
    @Column(name = "orario")
    private String orario;
    @Size(max = 100)
    @Column(name = "immagine")
    private String immagine;
    @ManyToMany(mappedBy = "eventiList", fetch = FetchType.EAGER)
    private List<Artisti> artistiList;
    @OneToMany(mappedBy = "evento", fetch = FetchType.EAGER)
    private List<Post> postList;
    @JoinColumn(name = "categoria", referencedColumnName = "idCategoria")
    @ManyToOne(fetch = FetchType.EAGER)
    private Categorie categoria;

    public Eventi() {
    }

    public Eventi(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public Eventi(Integer idEvento, String titolo, String luogo, String provincia, String descrizione, Date data) {
        this.idEvento = idEvento;
        this.titolo = titolo;
        this.luogo = luogo;
        this.provincia = provincia;
        this.descrizione = descrizione;
        this.data = data;
    }
    public Eventi(String titolo, Date data, String luogo,String provincia,  String orario, String descrizione, Categorie cat,String immagine) {
        this.titolo = titolo;
        this.luogo = luogo;
        this.provincia = provincia;
        this.descrizione = descrizione;
        this.data = data;
        this.orario=orario;
        this.immagine = immagine;
        this.categoria=cat;
    }

     public Eventi(String titolo, Date data, String luogo,String provincia, String orario, String descrizione, Categorie cat, Artisti artist,String immagine) {
        this.titolo = titolo;
        this.luogo = luogo;
        this.provincia = provincia;
        this.descrizione = descrizione;
        this.data = data;
        this.orario=orario;
        this.categoria=cat;
        artistiList=new ArrayList<Artisti>();
        artistiList.add(artist);
        this.immagine=immagine;
    }

    public Integer getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(Integer idEvento) {
        this.idEvento = idEvento;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getLuogo() {
        return luogo;
    }

    public void setLuogo(String luogo) {
        this.luogo = luogo;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getOrario() {
        return orario;
    }

    public void setOrario(String orario) {
        this.orario = orario;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public List<Artisti> getArtistiList() {
        return artistiList;
    }

    public void setArtistiList(List<Artisti> artistiList) {
        this.artistiList = artistiList;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public Categorie getCategoria() {
        return categoria;
    }

    public void setCategoria(Categorie categoria) {
        this.categoria = categoria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEvento != null ? idEvento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Eventi)) {
            return false;
        }
        Eventi other = (Eventi) object;
        if ((this.idEvento == null && other.idEvento != null) || (this.idEvento != null && !this.idEvento.equals(other.idEvento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJO.Eventi[ idEvento=" + idEvento + " ]";
    }

    public void addArtista(Artisti artista) {
        artistiList.add(artista);
    }
    
}
