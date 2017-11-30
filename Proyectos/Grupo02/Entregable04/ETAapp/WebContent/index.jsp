<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="xx/estilos.css"/>
<link rel="stylesheet" type="text/css" href="xx/normalize.css"/>
<title>ESCUELA TECNICA AVANZADA (ETA)</title>
<style type="text/css">

  #LOGON{
    width: 450px;
    margin: 5px auto;
    background-color: silver;
    border: 10px solid #29A490;
	border-radius: 10px;
    padding: 5px;
  }

</style>


</head>
<body>
	<div id="LOGON">
  	<div style="text-align: center;">
  		<img src="Image/logo.png"/>
  	</div>
  		<h1 style="text-align: center;">INGRESO AL SISTEMA</h1>
    
    <c:if test="${ error != null }">
      <div class="egcc_error">
        ${error}
      </div>
    </c:if>
  
     <form method="post" action="INGRESAR">
   
   	<div class="egcc_panel" >
   	
      <table>
        
        <tr>
          <td>USUARIO:</td>
          <td><input type="text"  name="usuario"/></td>
        </tr>
        
        <tr>
          <td>CLAVE:</td>
          <td><input type="password"  name="clave"/></td>
        </tr>

        
      </table>
       </div>
         
         <input class="egcc_btn_default" type="submit" value="Ingresar" />
     </form>
  	</div>

</body>
</html>