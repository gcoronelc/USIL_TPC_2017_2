<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONSULTAR ALUMNOS</title>
</head>
<body>

	<h1>CONSULTAR ALUMNOS</h1>
	
	<div id="SECCION_QUERY" class="egcc_panel">
	<form id="formQuery" >
	
	   <input id="btnBuscar" class="egcc_btn_default" type="button" value="Buscar" />
	
	</form>
	
	<!-- Resultado de la consulta -->
	<h2>LISTA DE ALUMNOS</h2>
	<table border="1">
	 <thead>
	   <tr>
	     <th>CODALUMNO</th>
	     <th>APELLIDO</th>
	     <th>NOMBRE</th>
	     <th>DNI</th>
	     <th>DIRECCION</th>
	     <th>TELEFONO</th>
	     <th>EMAIL</th>
	   </tr>
	 </thead>
	 <tbody id="datosTabla"></tbody>
	</table>
	
	
	</div>
	
	<script type="text/javascript">
	
		
		
		
		// Programar el Query
		
		$("#btnBuscar").click(fnBtnBuscar);
		
		function fnBtnBuscar(){
			
			// Datos
			var data = $("#formQuery").serialize();
			
			// Lectura del servidor
			$("#datosTabla").html("");
			$.post("LeerAlumnos", data, fnProccessResponse);
			
		}
		
		function fnProccessResponse(objJson){

			if( objJson.code == 1 ){
				
				var lista = $.parseJSON(objJson.text);
			    
				$.each(lista, function (index, r) {
				        
				  var row = "<tr>";
				  row += "<td>" + r.CODALUMNO + "</td>";
				  row += "<td>" + r.APELLIDO + "</td>";
				  row += "<td>" + r.NOMBRE + "</td>";
				  row += "<td>" + r.DNI + "</td>";
				  row += "<td>" + r.DIRECCION + "</td>";
				  row += "<td>" + r.TELEFONO + "</td>";
				  row += "<td>" + r.EMAIL + "</td>";
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