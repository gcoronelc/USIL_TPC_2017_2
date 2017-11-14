package pe.egcc.colegio.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pe.egcc.colegio.db.AccesoDB;

public class ColegioService {
  
  public int progSeccion(int periodo, int grado, int vacantes, int usuario){
    int seccion;
    Connection cn = null;
    try {
      // Inicio de Tx
      cn = AccesoDB.getConnection();
      cn.setAutoCommit(false);
      
      // Verificar permisos
      
      // Proceso
      String sql = "insert into SECCION(PERIODO,GRADO,"
          + "VACANTES,MATRICULADOS,IDEMPLEADO) "
          + "values(?,?,?,0,?)";
      PreparedStatement pstm = cn.prepareStatement(sql);
      pstm.setInt(1, periodo);
      pstm.setInt(2, grado);
      pstm.setInt(3, vacantes);
      pstm.setInt(4, usuario);
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

}
