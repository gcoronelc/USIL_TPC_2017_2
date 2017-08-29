<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RENTA</title>
</head>
<body>
  <h1>RENTA</h1>
  <h2>INPUT</h2>
  <form method="post" action="RentaController">
    <table>
     
      <tr>
        <td>Curso:</td>
        <td><input type="text" name="curso" /></td>
      </tr>
      
      <tr>
        <td>Precio:</td>
        <td><input type="text" name="precio" /></td>
      </tr> 
      
      <tr>
        <td>Horas:</td>
        <td><input type="text" name="horas" /></td>
      </tr> 
      
      <tr>
        <td>Alumnos:</td>
        <td><input type="text" name="cantAlu" /></td>
      </tr> 
      
      <tr>
        <td>Pago Prof.:</td>
        <td><input type="text" name="pagoHora" /></td>
      </tr>     
      
      <tr>
        <td colspan="2">
          <input type="submit" value="Procesar" />
       </td>
      </tr>
    
    </table>
  </form>
  
  <h2>OUTPUT</h2>
  <table>
     
     <tr>
       <td>Ingresos:</td>
       <td>${bean.ingresos}</td>
     </tr>
     
     <tr>
       <td>Gastos:</td>
       <td>${bean.gastos}</td>
     </tr> 
     
     <tr>
       <td>Renta:</td>
       <td>${bean.renta}</tr> 
    
  </table>    
  
  
  
</body>
</html>