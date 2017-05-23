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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author andre
 */
@Entity
@Table(name = "utenti")
@NamedQueries({
    @NamedQuery(name = "Utenti.findAll", query = "SELECT u FROM Utenti u")
    , @NamedQuery(name = "Utenti.findByIdUtente", query = "SELECT u FROM Utenti u WHERE u.idUtente = :idUtente")
    , @NamedQuery(name = "Utenti.findByNome", query = "SELECT u FROM Utenti u WHERE u.nome = :nome")
    , @NamedQuery(name = "Utenti.findByCognome", query = "SELECT u FROM Utenti u WHERE u.cognome = :cognome")
    , @NamedQuery(name = "Utenti.findByUsername", query = "SELECT u FROM Utenti u WHERE u.username = :username")
    , @NamedQuery(name = "Utenti.findByPassword", query = "SELECT u FROM Utenti u WHERE u.password = :password")
    , @NamedQuery(name = "Utenti.findByProvincia", query = "SELECT u FROM Utenti u WHERE u.provincia = :provincia")
    , @NamedQuery(name = "Utenti.findByAdmin", query = "SELECT u FROM Utenti u WHERE u.admin = :admin")
    , @NamedQuery(name = "Utenti.findByEmail", query = "SELECT u FROM Utenti u WHERE u.email = :email")
    , @NamedQuery(name = "Utenti.findByImmagine", query = "SELECT u FROM Utenti u WHERE u.immagine = :immagine")})
public class Utenti implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idUtente")
    private Integer idUtente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "cognome")
    private String cognome;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 42)
    @Column(name = "password")
    private String password;
    @Size(max = 30)
    @Column(name = "provincia")
    private String provincia;
    @Column(name = "admin")
    private Boolean admin;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 70)
    @Column(name = "email")
    private String email;
    @Size(max = 100)
    @Column(name = "immagine")
    private String immagine;
    @JoinTable(name = "ut_cat", joinColumns = {
        @JoinColumn(name = "idU", referencedColumnName = "idUtente")}, inverseJoinColumns = {
        @JoinColumn(name = "idC", referencedColumnName = "idCategoria")})
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Categorie> categorieList;
    @OneToMany(mappedBy = "utente", fetch = FetchType.EAGER)
    private List<Post> postList;

    public Utenti() {
    }

    public Utenti(Integer idUtente) {
        this.idUtente = idUtente;
    }

    public Utenti(Integer idUtente, String nome, String cognome, String username, String password, String email) {
        this.idUtente = idUtente;
        this.nome = nome;
        this.cognome = cognome;
        this.username = username;
        this.password = password;
        this.email = email;
    }
     public Utenti(String user, String nome, String cognome, String password, String mail, String provincia) {
        this.nome = nome;
        this.cognome = cognome;
        this.username = user;
        this.password = password;
        this.email = mail;
        this.provincia=provincia;
    }

    public Integer getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(Integer idUtente) {
        this.idUtente = idUtente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public List<Categorie> getCategorieList() {
        return categorieList;
    }

    public void setCategorieList(List<Categorie> categorieList) {
        this.categorieList = categorieList;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUtente != null ? idUtente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Utenti)) {
            return false;
        }
        Utenti other = (Utenti) object;
        if ((this.idUtente == null && other.idUtente != null) || (this.idUtente != null && !this.idUtente.equals(other.idUtente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "POJO.Utenti[ idUtente=" + idUtente + " ]";
    }

    public void addCategoria(Categorie categorie) {
        categorieList.add(categorie);
    }
    
}