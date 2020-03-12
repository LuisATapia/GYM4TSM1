<%-- 
    Document   : ubicacion
    Created on : 11/03/2020, 04:40:44 PM
    Author     : ROGELIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet"> 
       <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosUbicacion.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
    <title>Iniciar Sesión</title>
    </head>
    <body id="loginBody">
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="index.jsp" class="menu__link">Inicio</a></li>
              <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrate</a></li>
              <li class="menu__item"><a href="Login.jsp" class="menu__link">Inicia Sesi&oacute;n</a></li>
              <li class="menu__item"><a href="Ubicacion.jsp" class="menu__link select">Ubicaci&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
     <h1>Encuentranos</h1>
      <div class="contenedor">
          <h1>Encuentranos</h1>
                <div id="mapa" style="width: 700px;height:500px;">
            
        </div>
        <div>
            <script src="js/ubicacion.js"></script>
        </div>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v3"></script>
      </div>
    </div>
    </body>
</html>
