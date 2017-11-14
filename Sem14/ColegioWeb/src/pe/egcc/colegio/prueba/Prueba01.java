package pe.egcc.colegio.prueba;

import java.sql.Connection;

import pe.egcc.colegio.db.AccesoDB;

public class Prueba01 {

  public static void main(String[] args) {
    try {
      Connection cn = AccesoDB.getConnection();
      System.out.println("Chevere!!!!!");
      cn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
