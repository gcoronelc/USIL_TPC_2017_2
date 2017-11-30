package eta.app.prueba;

import java.sql.Connection;
import eta.app.db.AccesoDb;


public class Prueb01 {
	
	public static void main(String[] args) {
	    try {
	      Connection cn = AccesoDb.getConnection();
	      System.out.println("SALIOOO PAPU");
	      cn.close();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }

}
