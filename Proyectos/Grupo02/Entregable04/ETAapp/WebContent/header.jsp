<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table style="width: 100%">
  <tr>
    <td>
      <img alt="" src="Image/logo.png">
    </td>
    <td style="text-align: right;">
      USUARIO: ${ sessionScope.usuario.usuario }<br/>
      <a href="Salir">Salir</a>
    </td>
  </tr>
</table>