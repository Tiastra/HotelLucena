/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.hotellucena.controller;

/**
 *
 * @author C.Tiago
 */
import br.cesjf.hotellucena.dao.UsuariosDAO;
import br.cesjf.hotellucena.model.Usuarios;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;


  
@ManagedBean(name = "LoginMB")
@ViewScoped
public class LoginManagedBean {
  
  private UsuariosDAO usuarioDAO = new UsuariosDAO();
  private Usuarios usuario = new Usuarios();
   
  public String envia() {
         
    usuario = usuarioDAO.login(usuario.getNomeUsuario(), usuario.getEmailUsuario());
    if (usuario == null) {
      usuario = new Usuarios();
      FacesContext.getCurrentInstance().addMessage(
         null,
         new FacesMessage(FacesMessage.SEVERITY_ERROR, "Usuário não encontrado!",
           "Erro no Login!"));
      return null;
    } else {
          return "/index";
    }
         
         
  }
 
  public Usuarios getUsuario() {
    return usuario;
  }
 
  public void setUsuario(Usuarios usuario) {
    this.usuario = usuario;
  }
}
