package almadelsaber.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import almadelsaber.db.AccesoDB;



public class RegistrarAlumno {
	public int  registrarAlu(String Apellido,String Nombre,String DNI,String Direccion, String Telefono,
			String Email){
		int codalu;
		Connection cn = null;
	    try {
		 // Inicio de Tx
	      cn = AccesoDB.getConnection();
	      cn.setAutoCommit(false);
	      
	      // Verificar permisos
	      
	      // Proceso
	      String sql = "insert into ALUMNO(APELLIDO,NOMBRE, DNI,"
	          + "DIRECCION,TELEFONO,EMAIL) "
	          + "values(?,?,?,?,?,?)";
	      PreparedStatement pstm = cn.prepareStatement(sql);
	      pstm.setString(1, Apellido);
	      pstm.setString(2, Nombre);
	      pstm.setString(3, DNI);
	      pstm.setString(4, Direccion);
	      pstm.setString(5, Telefono);
	      pstm.setString(6, Email);
	      pstm.executeUpdate();
	      pstm.close();
	      
	      sql = "SELECT IDENT_CURRENT('ALUMNO') alumno";
	      pstm = cn.prepareStatement(sql);
	      ResultSet rs = pstm.executeQuery();
	      rs.next();
	      codalu = rs.getInt("alumno");
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
	    return codalu;
	  
	}
	
	
	public List<Map<String,Object>> leerAlumnos(){
	    List<Map<String,Object>> lista = null;
	    Connection cn = null;
	    try {
	      cn = AccesoDB.getConnection();
	     
	      String sql = "select * from ALUMNO";
	      PreparedStatement pstm = cn.prepareStatement(sql);
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


