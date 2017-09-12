<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <h2>RESTAR</h2>
  <form method="post" action="Restar">
    
    <label>Número 1:</label>
    <input type="text" name="num1" /><br/>
    
    <label>Número 2:</label>
    <input type="text" name="num2" /><br/>
    
    <input type="submit" value="Procesar" />
  </form>
  
  <c:if test="${ resta != null }">
	  <h2>REPORTE</h2>
	  <p>Número 1: ${num1}</p>
	  <p>Número 2: ${num2}</p>
	  <p>Suma: ${resta}</p>
  </c:if>
  
  
</body>
</html>