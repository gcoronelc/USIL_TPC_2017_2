<%@page import="pe.egcc.promapp.model.PromModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>REPORTE</h1>
    <% PromModel bean = (PromModel) request.getAttribute("bean");%>
    <table>

      <tr>
        <td>Prom. Practicas</td>
        <td><%= bean.getPp()%></td>
      </tr>

      <tr>
        <td>Prom. Final</td>
        <td><%= bean.getPf()%></td>
      </tr>

      <tr>
        <td>Condición:</td>
        <td><%= bean.getCond()%></td>
      </tr>

    </table>

    <a href="index.html">Retornar</a>

  </body>
</html>
