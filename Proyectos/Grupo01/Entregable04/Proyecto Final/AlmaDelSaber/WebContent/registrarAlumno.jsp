<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRAR ALUMNO</title>
</head>
<body>

	<h1>REGISTRAR NUEVO ALUMNO</h1>
	
	
	
	<div id="ALUMNO_NEW" class="egcc_panel" >
	<h2>NUEVO ALUMNO</h2>
	<form id="formNew">
		
		<table>
			<tr>
				<td>Usuario:</td>
				<td>${ sessionScope.usuario.usuario }</td>
			</tr>
			<tr>
				<td>Apellido:</td>
				<td><input type="text" name="apellido" /></td>
			</tr>
			<tr>
        		<td>Nombre:</td>
        		<td><input type="text" name="nombre" /></td>
      		</tr>
			<tr>
				<td>DNI:</td>
				<td><input type="text" name="dni" /></td>
			</tr>	
			<tr>
				<td>Direccion:</td>
				<td><input type="text" name="direccion" /></td>
			</tr>	
			<tr>
				<td>Telefono:</td>
				<td><input type="text" name="telefono" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" /></td>
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
			$.post("RegistrarAlu", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
		
		
		
	</script>


</body>
</html>