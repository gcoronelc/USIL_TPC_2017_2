<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CARRITO APP</title>
<style type="text/css">
form
{
   padding:2px;
   cursor:pointer;
   display:block;
   width:200px;
   margin: 0 auto;
   text-align:center;
}  
</style>
</head>
<body>
	
	<!-- Cabecera -->
	<jsp:include page="cabecera.jsp"/>
	
	<!-- Formulario -->
	<form method="post" action="Agregar">
	
	<h2>Agregar Item</h2>
  
  <p>Mensaje: ${mensaje}</p>
  
	<table>
    <tr>
      <td>Producto:</td>
      <td><input type="text" name="producto"/></td>
    </tr>	
    <tr>
      <td>Precio:</td>
      <td><input type="text" name="precio"/></td>
    </tr>
    <tr>
      <td>Cantidad:</td>
      <td><input type="text" name="cant"/></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="Agregar"/>
      </td>
    </tr>
	</table>
	</form>
</body>
</html>