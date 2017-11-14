package pe.egcc.colegio.prueba;

import pe.egcc.colegio.model.Usuario;
import pe.egcc.colegio.service.LogonService;

public class Prueba02 {

  public static void main(String[] args) {
    System.out.println("Gustavo");
    try {
      // Datos
      String usuario = "gustavo";
      String clave = "gustavo";
      // Proceso
      LogonService logonService = new LogonService();
      Usuario  user = logonService.validar(usuario, clave);
      // Reporte
      System.out.println("Usuario: " + user.getUsuario());
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
