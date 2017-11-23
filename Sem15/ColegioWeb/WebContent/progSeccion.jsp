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
	       <td><input id="btnNuevo" type="button" value="Nuevo" /></td>
	     </tr>
	   
	   </table>
	
	</form>
	
	<!-- Resultado de la consulta -->
	<h2>SECCIONES PROGRAMADAS</h2>
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
	 <tbody id="datosTabla"></tbody>
	</table>
	
	
	</div>
	
	
	<div id="SECCION_NEW" class="egcc_panel" style="display: none;" >
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
		<input id="btnNuevoCancelar" class="egcc_btn_default" type="button" value="Cancelar" />
		
	</form>
	
	<br/>
	
	</div>
	
	<script type="text/javascript">
	
		$("#btnNuevoProcesar").click(fnBtnNuevoProcesar);
		
		$("#btnNuevo").click(function(){
			
			$("#SECCION_QUERY").hide();
			$("#SECCION_NEW").show();
			
		});
		
		$("#btnNuevoCancelar").click(function(){
		      
		      $("#SECCION_QUERY").show();
		      $("#SECCION_NEW").hide();
		      
	 });
		
		
		function fnBtnNuevoProcesar(){
			var data = $("#formNew").serialize();
			$.post("ProgSeccion", data, function( mensaje ){
				
				alert( mensaje );
				
			});
		}
		
		
		// Programar el Query
		
		$("#query_periodo").keyup(fnHayCambio);
		
		$("#query_nivel").change(fnHayCambio);
		
		function fnHayCambio(){
			
			// Datos
			var data = $("#formQuery").serialize();
			
			// Lectura del servidor
			$("#datosTabla").html("");
			$.post("LeerSecciones", data, fnProccessResponse);
			
		}
		
		function fnProccessResponse(objJson){

			if( objJson.code == 1 ){
				
				var lista = $.parseJSON(objJson.text);
			    
				$.each(lista, function (index, r) {
				        
				  var row = "<tr>";
				  row += "<td>" + r.grado + "</td>";
				  row += "<td>" + r.nomgrado + "</td>";
				  row += "<td>" + r.seccion + "</td>";
				  row += "<td>" + r.nombre + "</td>";
				  row += "<td>" + r.vacantes + "</td>";
				  row += "<td>" + r.matriculados + "</td>";
				  row += "<td><a href='#'>Falta</a></td>";
				  row += "</tr>";         
				  $("#datosTabla").append( row );
				        
				});

			} else {
				alert(objJson.text);
			}
			
		}
		
	</script>


</body>
</html>