<%-- 
    Document   : Aviso
    Created on : 6/02/2020, 08:03:40 AM
    Author     : LuisAngel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosAviso.css">
        <title>JSP Page</title>
    </head>
    
        <%
        HttpSession validar=request.getSession();
        validar.getAttribute("id_persona");
        if (validar.getAttribute("id_persona")==null)
        {
            response.sendRedirect("Login.jsp");
        }
        %>
        <body id="loginBody">
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="index.jsp" class="menu__link select">Inicio</a></li>
            <li class="menu__item"><a href="#" class="menu__link">Registrate</a></li>
            <li class="menu__item"><a href="#" class="menu__link">Inicia Sesi&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
                    <article>
                <h1>Su pago ha expirado!</h1>
                <h2>Porfavor, acuda al gimnasio a realizarlo.</h2>
                <h2>Con el siguiente Folio:<%=validar.getAttribute("id_persona")%></h2>
                <h3>:(</h3>
                <a href="Login.jsp">Volver !</a>
            </article> 
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
</html>
