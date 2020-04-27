/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.hotellucena.converter;

import br.cesjf.hotellucena.model.Item;
import javax.faces.bean.ManagedBean;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author C.Tiago
 */
@FacesConverter("itemConverter")
@ManagedBean
public class ItemConverter implements Converter {

    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String value) {
        if (value != null && !value.isEmpty()) {
            return (Item) uic.getAttributes().get(value);
        }
        return null;
    }

    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object value) {
        if (value instanceof Item) {
            Item pergunta = (Item) value;
            if (pergunta != null && pergunta instanceof Item && pergunta.getIdItem() != null) {
                uic.getAttributes().put(pergunta.getIdItem().toString(), pergunta);
                return pergunta.getIdItem().toString();
            }
        }
        return "";
    }
}
