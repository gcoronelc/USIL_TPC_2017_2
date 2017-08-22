package pe.egcc.promapp.prueba;

import pe.egcc.promapp.model.PromModel;
import pe.egcc.promapp.service.PromService;

public class Prueba01 {

  public static void main(String[] args) {
    
    // Dato
    PromModel model = new PromModel(12, 15, 14, 16, 14);
    
    // Proceso
    PromService service = new PromService();
    model = service.procesar(model);
    
    // Reporte
    System.out.println("PP: " + model.getPp());
    System.out.println("PF: " + model.getPf());
    System.out.println("Cond: " + model.getCond());
    
  }
  
}
