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
	
	<div id="SECCION_QUERY" class="egcc_panel">
	<form id="formQuery" >
	
	   <table>
	     <tr>
	       <td>Usuario</td>
	       <td>Periodo</td>
	       <td>Nivel</td>
	       <td></td>
	     </tr>
	     <tr>
	       <td>${ sessionScope.usuario.usuario }</td>
	       <td><input id="query_periodo" type="text" name="periodo" /></td>
	       <td>
	         <select id="query_nivel" name="nivel">
	           <option value="1">Primaria</option>
	           <option value="2">Secundaria</option>
	         </select>
	       </td>
	       <td><input type="button" value="Nuevo" /></td>
	     </tr>
	   
	   </table>
	
	</form>
	
	<!-- Resultado de la consulta -->
	<table border="1">
	 <thead>
	   <tr>
	     <th>GRADO</th>
	     <th>NOM.GRADO</th>
	     <th>SECCION</th>
	     <th>NOM.SECCION</th>
	     <th>VACANTES</th>
	     <th>MATRICULADOS</th>
	     <th>ACCIONES</th>
	   </tr>
	 </thead>
	</table>
	
	
	</div>
	
	
	<div id="SECCION_NEW" class="egcc_panel"  >
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
		
		<input id="btnProcesar" class="egcc_btn_default" type="button" value="Procesar" />
		
	</form>
	
	<br/>
	
	</div>
	
	<script type="text/javascript">
	
		$("#btnProcesar").click(fnBtnProcesar);
		
		
		function fnBtnProcesar(){
			var data = $("#formNew").serialize();
			$.post("ProgSeccion", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
		
		// Programar el Query
		
		$("#query_periodo").keyup(fnHayCambio);
		
		$("#query_nivel").change(fnHayCambio);
		
		function fnHayCambio(){
			console.log("Hay cambios");
		}
		
		
	</script>


</body>
</html>