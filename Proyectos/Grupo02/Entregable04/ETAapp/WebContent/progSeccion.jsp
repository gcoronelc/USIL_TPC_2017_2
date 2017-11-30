<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PROGRAMANDO SECCION</title>
</head>
<body>

<h1>PROGRAMAR SECCION</h1>
<form id="form1">

<table>
			<tr>
				<td>USUARIO:</td>
				<td>${ sessionScope.usuario.usuario }</td>
			</tr>
			<tr>
				<td>PERIODO:</td>
				<td><input type="text" name="periodo" /></td>
			</tr>
			<tr>
				<td>GRADO:</td>
				<td><input type="text" name="grado" /></td>
			</tr>	
			<tr>
				<td>VACANTES:</td>
				<td><input type="text" name="vacantes" /></td>
			</tr>				
		</table>
		
		<input id="btnProcesar" class="egcc_btn_default" type="button" value="Procesar" />
		
	</form>
	
	<script type="text/javascript">
	
		$("#btnProcesar").click(fnBtnProcesar);
		
		
		function fnBtnProcesar(){
			var data = $("#form1").serialize();
			$.post("programarSec", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
	</script>

</body>
</html>