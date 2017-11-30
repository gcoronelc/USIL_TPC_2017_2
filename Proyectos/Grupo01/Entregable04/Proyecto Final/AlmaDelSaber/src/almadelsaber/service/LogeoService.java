package almadelsaber.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import almadelsaber.db.AccesoDB;
import almadelsaber.model.UsuarioModel;

public class LogeoService {
	public UsuarioModel validar(String usuario, String clave){
	    Connection cn = null;
	    UsuarioModel bean = null;
	    try {
	      cn = AccesoDB.getConnection();
	      String sql = "select idempleado, idrol, "
	              + "usuario, estado "
	              + "from usuario "
	              + "where usuario = ? "
	              //+ "and clave = HashBytes('SHA1',?) "
	              + "and estado = 1";
	      PreparedStatement pstm = cn.prepareStatement(sql);
	      pstm.setString(1, usuario);
	      //pstm.setString(2, clave);
	      ResultSet rs = pstm.executeQuery();
	      if(rs.next()){
	        bean = new UsuarioModel();
	        bean.setIdempleado(rs.getInt("idempleado"));
	        bean.setIdrol(rs.getInt("idrol"));
	        bean.setUsuario(rs.getString("usuario"));
	        bean.setEstado(rs.getInt("estado"));
	      }
	      rs.close();
	      pstm.close();
	    } catch (SQLException e) {
	      throw new RuntimeException(e.getMessage());
	    } catch (Exception e) {
	      throw new RuntimeException("Datos incorrectos");
	    } finally{
	      try {
	        cn.close();
	      } catch (Exception e2) {
	      }
	    }
	    return bean;
	  }

}
