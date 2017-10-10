<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CARRITO APP</title>
</head>
<body>

  <!-- Cabecera -->
  <jsp:include page="cabecera.jsp"/>
  
  <h1>CARRITO</h1>
  
  <table>
  
    <thead>
      <tr>
        <th>ID</th>
        <th>PRODUCTO</th>
        <th>PRECIO</th>
        <th>CANT</th>
        <th>SUBTOTAL</th>
        <th>ACCION</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${sessionScope.carrito.lista}" var="r">
        <tr>
          <td>${r.id}</td>
          <td>${r.producto}</td>
          <td>${r.precio}</td>
          <td>${r.cant}</td>
          <td>${r.subtotal}</td>
          <td><a href="Eliminar?id=${r.id}">Eliminar</a></td>
        </tr>
      </c:forEach>
    </tbody>
  
    <tfoot>
      <tr>
        <td colspan="4" style="text-align: center;">Importe</td>
        <td>${sessionScope.carrito.importe}</td>
        <td></td>
      </tr>
      <tr>
        <td colspan="4" style="text-align: center;">Impuesto</td>
        <td>${sessionScope.carrito.impuesto}</td>
        <td></td>
      </tr>
      <tr>
        <td colspan="4" style="text-align: center;">Total</td>
        <td>${sessionScope.carrito.total}</td>
        <td></td>
      </tr>
    </tfoot>
  
  </table>
  
  
</body>
</html>