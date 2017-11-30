<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Plantillas/Estilos.css"/>
<link rel="stylesheet" type="text/css" href="Plantillas/normalize.css"/>
<title>Alma del Saber</title>
<style type="text/css">

  #LOGON{
    width: 450px;
    margin: 5px auto;
    background-color: white;
    border: 10px solid #D2691E;
	border-radius: 10px;
    padding: 5px;
  }

</style>


</head>
<body>
	<div id="LOGON">
  	<div style="text-align: center;">
  		<img src="img/LogoCole.jpg"/>
  	</div>
  		<h1 style="text-align: center;">INGRESO AL SISTEMA</h1>
    
    <c:if test="${ error != null }">
      <div class="egcc_error">
        ${error}
      </div>
    </c:if>
  
     <form method="post" action="Ingresar">
   
   	<div class="egcc_panel" >
   	
      <table>
        
        <tr>
          <td>Usuario:</td>
          <td><input type="text"  name="usuario"/></td>
        </tr>
        
        <tr>
          <td>Clave:</td>
          <td><input type="password"  name="clave"/></td>
        </tr>

        
      </table>
       </div>
         
         <input class="egcc_btn_default" type="submit" value="Ingresar" />
     </form>
  	</div>

</body>
</html>