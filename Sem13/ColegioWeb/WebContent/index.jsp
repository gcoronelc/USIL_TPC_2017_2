<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/estilos.css">
<title>COLEGIO SOFT</title>
<style type="text/css">

  #LOGON{
    width: 350px;
    margin: 5px auto;
    background-color: white;
    padding: 5px;
  }

</style>
</head>
<body>
  <div id="LOGON">
  	<div style="text-align: center;">
  		<img src="img/logo.png"/>
  	</div>
  	

  	
    <h1>INGRESO AL SISTEMA</h1>
    
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