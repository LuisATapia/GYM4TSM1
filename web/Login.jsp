<%@page import="conexiones.Personas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet"> 
       <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosLogin.css">
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
              <li class="menu__item"><a href="Login.jsp" class="menu__link select">Inicia Sesi&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
      <form action="Canal.jsp" method="post" >
          <h1>Inicia Sesi&oacute;n</h1>
          <input type="email" placeholder="Usuario" name="txtUsuarioLogin"><br>
          <input type="password" placeholder="Contraseña" name="txtPassLogin"><br>
          <input type="submit" value="Ingresar" id="btnIngresar">
              <p><a href="Registrar.jsp">Registrate aqu&iacute;</a></p>
      </form>
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
<%  
   /*Personas p=new Personas();
    p.setCurp(request.getParameter("txtUsuario"));
    p.setPasswd(request.getParameter("txtPass"));
    p.validarUsuario();
    if (p.getTipo_usuario()==1){
        response.sendRedirect("indez.jsp");
    }else if (p.getTipo_usuario()==0)
    {
        response.sendRedirect("Registrar.jsp");
    }
    System.out.println(p.getTipo_usuario()); */
   
    %>
</html>
=======
<%-- 
    Document   : Login
    Created on : 28/01/2020, 09:57:09 PM
    Author     : LuisAngel
--%>

<%@page import="conexiones.Personas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet"> 
       <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosLogin.css">
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
              <li class="menu__item"><a href="index.jsp" class="menu__link ">Inicio</a></li>
              <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrate</a></li>
              <li class="menu__item"><a href="Login.jsp" class="menu__link select">Inicia Sesi&oacute;n</a></li>
              <li class="menu__item"><a href="Ubicacion.jsp" class="menu__link ">Ubicaci&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
      <form action="Canal.jsp" method="post" >
          <h1>Inicia Sesi&oacute;n</h1>
          <input type="email" placeholder="Usuario" name="txtUsuarioLogin" ><br>
          <input type="password" placeholder="Contraseña" name="txtPassLogin"><br>
          <input type="submit" value="Ingresar" id="btnIngresar">
          <p><a href="Registrar.jsp">Registrate aqu&iacute;</a></p>
      </form>
      </div>
    </div>
    <script src="js/script.js"></script>
        <script src="jquery.min.js"></script>
    <script src="js/DisabledMetaComands.js"></script>
  </body>
</html>

>>>>>>> b387c5e1140384d7185b047eef0daea1fcfb253b
