package pe.egcc.promapp.service;

import pe.egcc.promapp.model.PromModel;

public class PromService {

  public PromModel procesar(PromModel bean){
    // Variables
    int pp, pf;
    String cond;
    // Proceso
    pp = (bean.getPrct1() + bean.getPrct2() + bean.getPrct3()) / 3;
    pf = ( pp + bean.getEp() + bean.getEf()) / 3;
    cond = (pf>=13?"Aprobado":"Desaprobado");
    // Reporte
    bean.setPp(pp);
    bean.setPf(pf);
    bean.setCond(cond);
    return bean;    
  }
          
  
  
}
