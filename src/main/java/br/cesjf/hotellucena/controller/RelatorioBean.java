/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.cesjf.hotellucena.controller;

import br.cesjf.hotellucena.util.Relatorio;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.omnifaces.cdi.ViewScoped;
import javax.inject.Named;
/**
 *
 * @author C.Tiago
 */
@Named
@ViewScoped
public class RelatorioBean implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String relatorio;
    
    private Map<String, String> tipos;
    
    private List<Date> range;

    public RelatorioBean() {
        tipos = new HashMap<>();
        tipos.put("Gráfico Quartos Reservados/Liberados", "grafico_status_quartos");
        tipos.put("Relatório de Quartos Reservados", "quartos_reservados");
        tipos.put("Relatório de Quartos Ocupado", "relatorio_quartos_ocupados");
        tipos.put("Relatório de Quartos Liberados", "reservas_concluidas");
        range = new ArrayList<>();
    }

    public String getRelatorio() {
        return relatorio;
    }

    public void setRelatorio(String relatorio) {
        this.relatorio = relatorio;
    }

    public Map<String, String> getTipos() {
        return tipos;
    }

    public void setTipos(Map<String, String> tipos) {
        this.tipos = tipos;
    }
    
    public void gerarRelatorio() {
        Relatorio relat = new Relatorio();
        relat.getRelatorio(this.relatorio, null, null);
    }
    

    public List<Date> getRange() {
        return range;
    }

    public void setRange(List<Date> range) {
        this.range = range;
    }
    
}