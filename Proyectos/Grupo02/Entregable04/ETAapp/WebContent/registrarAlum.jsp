<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ETA Registro Alumno</title>
</head>
<body>
<h1>registrar alumno</h1>
<form id="form1">

<table>
			<tr>
        <td>USUARIO:</td>
        <td>${ sessionScope.usuario.usuario }</td>
      </tr>
			<tr>
				<td>ALUMNO:</td>
				<td><input type="text" name="estudiante" /></td>
			</tr>
			<tr>
				<td>APELLIDO:</td>
				<td><input type="text" name="apellido" /></td>
			</tr>
			<tr>
				<td>DNI:</td>
				<td><input type="text" name="dni" /></td>
			</tr>		
			<tr>
				<td>DIRECCION:</td>
				<td><input type="text" name="direccion" /></td>
			</tr>	
			<tr>
				<td>TELEFONO:</td>
				<td><input type="text" name="telefono" /></td>
			</tr>	
				<tr>
				<td>E-MAIL:</td>
				<td><input type="text" name="email" /></td>
			</tr>			
		</table>
		
		<input id="btnProcesar" class="egcc_btn_default" type="button" value="Procesar" />
		
	</form>
	
	<script type="text/javascript">
	
		$("#btnProcesar").click(fnBtnProcesar);
		
		
		function fnBtnProcesar(){
			var data = $("#form1").serialize();
			$.post("---------", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
	</script>
</body>
</html>