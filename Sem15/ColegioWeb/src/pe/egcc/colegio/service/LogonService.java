package pe.egcc.colegio.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pe.egcc.colegio.db.AccesoDB;
import pe.egcc.colegio.model.Usuario;

public class LogonService {

  public Usuario validar(String usuario, String clave){
    Connection cn = null;
    Usuario bean = null;
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
        bean = new Usuario();
        bean.setIdempleado(rs.getInt("idempleado"));
        bean.setIdrol(rs.getInt("idrol"));
        bean.setUsuario(rs.getString("usuario"));
        bean.setIdempleado(rs.getInt("estado"));
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
