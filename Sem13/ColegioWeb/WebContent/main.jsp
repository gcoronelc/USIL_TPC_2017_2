<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="recursos.jsp"/>
<title>Insert title here</title>
</head>
<body>
  <div class="egcc_page">
  
    <div class="egcc_header">
      <jsp:include page="header.jsp"/>
    </div>
  
    <div class="egcc_menu">
      <jsp:include page="menu/menu.jsp"/>
    </div>
    
    <div id="egcc_content" class="egcc_content">
      <div style="text-align: center; margin: 15px;">
        <img alt="" src="img/portada.jpg"/>
      </div>
    </div>
    
    <div class="egcc_footer">
      <jsp:include page="footer.jsp"/>
    </div>
                
  </div>
</body>
</html>