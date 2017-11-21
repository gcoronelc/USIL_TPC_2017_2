Connection cn = null;
try {
  // Inicio de Tx
  cn = AccesoDB.getConnection();
  cn.setAutoCommit(false);
  // Proceso
  
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
