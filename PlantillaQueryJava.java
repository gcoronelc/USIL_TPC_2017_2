Connection cn = null;
try {
	cn = AccesoDB.getConnection();
	
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