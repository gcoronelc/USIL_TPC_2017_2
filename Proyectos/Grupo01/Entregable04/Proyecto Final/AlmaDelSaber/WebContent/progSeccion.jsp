<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PROGRAMAR SECCION</title>
</head>
<body>

	<h1>PROGRAMAR SECCION</h1>
	
	
	
	<div id="SECCION_NEW" class="egcc_panel" >
	<h2>NUEVA SECCION</h2>
	<form id="formNew">
		
		<table>
			<tr>
				<td>Usuario:</td>
				<td>${ sessionScope.usuario.usuario }</td>
			</tr>
			<tr>
				<td>Periodo:</td>
				<td><input type="text" name="periodo" /></td>
			</tr>
			<tr>
        <td>Nombre:</td>
        <td><input type="text" name="nombre" /></td>
      </tr>
			<tr>
				<td>Grado:</td>
				<td><input type="text" name="grado" /></td>
			</tr>	
			<tr>
				<td>Vacantes:</td>
				<td><input type="text" name="vacantes" /></td>
			</tr>				
		</table>
		
		<input id="btnNuevoProcesar" class="egcc_btn_default" type="button" value="Procesar" />
		
	</form>
	
	<br/>
	
	</div>
	
	<script type="text/javascript">
	
	$("#btnNuevoProcesar").click(fnBtnNuevoProcesar);
	
		
		
		function fnBtnNuevoProcesar(){
			var data = $("#formNew").serialize();
			$.post("ProgSeccion", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
		
		
		
	</script>


</body>
</html>