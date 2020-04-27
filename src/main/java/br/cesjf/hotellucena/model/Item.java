/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.hotellucena.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author tassio
 */
@Entity
@Table(name = "item")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Item.findAll", query = "SELECT i FROM Item i"),
    @NamedQuery(name = "Item.findByIdItem", query = "SELECT i FROM Item i WHERE i.idItem = :idItem"),
    @NamedQuery(name = "Item.findByCodItem", query = "SELECT i FROM Item i WHERE i.codItem = :codItem"),
    @NamedQuery(name = "Item.findByNomeItem", query = "SELECT i FROM Item i WHERE i.nomeItem = :nomeItem"),
    @NamedQuery(name = "Item.findByDescricaoItem", query = "SELECT i FROM Item i WHERE i.descricaoItem = :descricaoItem"),
    @NamedQuery(name = "Item.findByValorItem", query = "SELECT i FROM Item i WHERE i.valorItem = :valorItem")})
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idItem")
    private Integer idItem;
    @Basic(optional = false)
    @Column(name = "codItem")
    private int codItem;
    @Basic(optional = false)
    @Column(name = "nomeItem")
    private String nomeItem;
    @Basic(optional = false)
    @Column(name = "descricaoItem")
    private String descricaoItem;
    @Basic(optional = false)
    @Column(name = "valorItem")
    private float valorItem;

    public Item() {
    }

    public Item(Integer idItem) {
        this.idItem = idItem;
    }

    public Item(Integer idItem, int codItem, String nomeItem, String descricaoItem, float valorItem) {
        this.idItem = idItem;
        this.codItem = codItem;
        this.nomeItem = nomeItem;
        this.descricaoItem = descricaoItem;
        this.valorItem = valorItem;
    }

    public Integer getIdItem() {
        return idItem;
    }

    public void setIdItem(Integer idItem) {
        this.idItem = idItem;
    }

    public int getCodItem() {
        return codItem;
    }

    public void setCodItem(int codItem) {
        this.codItem = codItem;
    }

    public String getNomeItem() {
        return nomeItem;
    }

    public void setNomeItem(String nomeItem) {
        this.nomeItem = nomeItem;
    }

    public String getDescricaoItem() {
        return descricaoItem;
    }

    public void setDescricaoItem(String descricaoItem) {
        this.descricaoItem = descricaoItem;
    }

    public float getValorItem() {
        return valorItem;
    }

    public void setValorItem(float valorItem) {
        this.valorItem = valorItem;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idItem != null ? idItem.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Item)) {
            return false;
        }
        Item other = (Item) object;
        if ((this.idItem == null && other.idItem != null) || (this.idItem != null && !this.idItem.equals(other.idItem))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.cesjf.hotellucena.model.Item[ idItem=" + idItem + " ]";
    }
    
}
