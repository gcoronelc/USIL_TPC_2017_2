package pe.egcc.renta.service;

import pe.egcc.renta.model.RentaModel;

public class RentaService {
  
  public RentaModel procesarRenta( RentaModel bean ){
    // Variables
    double ingresos, gastos, renta;
    // Proceso
    ingresos = bean.getPrecio() * bean.getCantAlu();
    double pagoProf = bean.getHoras() * bean.getPagoHora();
    double gasPub = ingresos * 0.08;
    double gasAdm = ingresos * 0.05;
    double gasMat = ingresos * 0.06;
    double gasEqu = ingresos * 0.04;
    gastos = pagoProf + gasPub + gasAdm + gasMat + gasEqu;
    renta = ingresos - gastos;
    // Salida
    bean.setIngresos(ingresos);
    bean.setGastos(gastos);
    bean.setRenta(renta);    
    // Retorno
    return bean;
  }
   
}
