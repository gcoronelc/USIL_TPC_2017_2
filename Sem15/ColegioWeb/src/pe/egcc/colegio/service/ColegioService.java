package pe.egcc.colegio.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import pe.egcc.colegio.db.AccesoDB;

public class ColegioService {
  
  public int progSeccion(String nombre, int periodo, int grado, int vacantes, int usuario){
    int seccion;
    Connection cn = null;
    try {
      // Inicio de Tx
      cn = AccesoDB.getConnection();
      cn.setAutoCommit(false);
      
      // Verificar permisos
      
      // Proceso
      String sql = "insert into SECCION(PERIODO,NOMBRE, GRADO,"
          + "VACANTES,MATRICULADOS,IDEMPLEADO) "
          + "values(?,?,?,?,0,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setInt(1, periodo);
      pstm.setString(2, nombre);
      pstm.setInt(3, grado);
      pstm.setInt(4, vacantes);
      pstm.setInt(5, usuario);
      pstm.executeUpdate();
      pstm.close();
      
      sql = "SELECT IDENT_CURRENT('SECCION') seccion";
      pstm = cn.prepareStatement(sql);
      ResultSet rs = pstm.executeQuery();
      rs.next();
      seccion = rs.getInt("seccion");
      rs.close();
      pstm.close();
      
      // Confirmar Tx
      cn.commit();
      
    } catch (SQLException e) {
      try {
        cn.rollback();
      } catch (Exception e2) {
      }
      throw new RuntimeException(e.getMessage());
    } catch (Exception e) {
      try {
        cn.rollback();
      } catch (Exception e2) {
      }
      throw new RuntimeException("Error en el proceso.");
    } finally{
      try {
        cn.close();
      } catch (Exception e2) {
      }
    }
    return seccion;
  }
  
  public List<Map<String,Object>> leerSecciones(int periodo, int nivel){
    List<Map<String,Object>> lista = null;
    Connection cn = null;
    try {
      cn = AccesoDB.getConnection();
     
      String sql = "select periodo, nivel, nomnivel, "
          + "grado, nomgrado, seccion, nombre, "
          + "vacantes, matriculados "
          + "from v_secciones "
          + "where periodo = ? and nivel = ?";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setInt(1, periodo);
      pstm.setInt(2, nivel);
      ResultSet rs = pstm.executeQuery();
      lista = JdbcUtil.rsToList(rs);
      rs.close();
      pstm.close();
      
    } catch (SQLException e) {
      throw new RuntimeException(e.getMessage());
    } catch (Exception e) {
      String msg = "No se tiene acceso a la BD.";
      throw new RuntimeException(msg);
    } finally{
      try {
        cn.close();
      } catch (Exception e) {
      }
    }
    return lista;
  }
  

}
