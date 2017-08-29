package pe.egcc.renta.prueba;

import pe.egcc.renta.model.RentaModel;
import pe.egcc.renta.service.RentaService;

public class Prueba01 {
  
  public static void main(String[] args) {
    // Dato
    RentaModel model = new RentaModel("Spring", 500.0, 30, 30, 150.0);
    // Proceso
    RentaService service = new RentaService();
    model = service.procesarRenta(model);
    // Reporte
    System.out.println("Ingresos: " + model.getIngresos());
    System.out.println("Gastos: " + model.getGastos());
    System.out.println("Renta: " + model.getRenta());
  }
  
}
