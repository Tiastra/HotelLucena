/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.hotellucena.dao;

import br.cesjf.hotellucena.model.Item;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import br.cesjf.hotellucena.util.PersistenceUtil;

/**
 *
 * @author C.Tiago
 */
public class ItemDAO {

    public static ItemDAO itemDAO;

    public static ItemDAO getInstance() {
        if (itemDAO == null) {
            itemDAO = new ItemDAO();
        }
        return itemDAO;
    }

    public Item buscar(String nome) {
        EntityManager em = PersistenceUtil.getEntityManager();
        Query query = em.createQuery("select i from Item i where i.nomeItem =:nome ");
        query.setParameter("nome", nome);

        List<Item> item = query.getResultList();
        if (item != null && item.size() > 0) {
            return item.get(0);
        }

        return null;
    }

    public List<Item> buscarTodas() {
        EntityManager em = PersistenceUtil.getEntityManager();
        Query query = em.createQuery("from Item As i");
        return query.getResultList();
    }

    public void remover(Item item) {
        EntityManager em = PersistenceUtil.getEntityManager();
        em.getTransaction().begin();
        if (!em.contains(item)) {
            item = em.merge(item);
        }
        em.remove(item);
        em.getTransaction().commit();
    }

    public Item persistir(Item item) {
        EntityManager em = PersistenceUtil.getEntityManager();
        em.getTransaction().begin();
        try {
            item = em.merge(item);
            em.getTransaction().commit();
            System.out.println("Registro Item gravado com sucesso");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    public void removeAll() {
        EntityManager em = PersistenceUtil.getEntityManager();
        em.getTransaction().begin();
        Query query = em.createQuery(" delete from Item ");
        query.executeUpdate();
        em.getTransaction().commit();
    }

}
