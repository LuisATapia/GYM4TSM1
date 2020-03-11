<%-- 
    Document   : menuEntrenador
    Created on : 4/02/2020, 10:26:05 AM
    Author     : ROGELIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosMenuEntrenador.css">
   <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
    <title>Menu Principal</title>
    </head>
    <body id="loginBody">
        <%
        HttpSession validar=request.getSession();
        validar.getAttribute("id_persona");
        if (validar.getAttribute("id_persona")==null || validar.getAttribute("id_persona").equals("0"))
        {
            response.sendRedirect("Login.jsp");
        }
        %>
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="#" class="menu__link"></a></li>
            <li class="menu__item"><a href="#" class="menu__link"></a></li>
            <li class="menu__item"><a href="#" class="menu__link"></a></li>
            <li class="menu__item"><a href="#" class="menu__link"></a></li>
            <li class="menu__item"><a href="#" class="menu__link select" onclick="cerrarVentana();">Cerrar Sesi&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
      <section class="menu2">      
          <h1>Men&uacute;</h1>
          <a href="ModificarPersona.jsp">Mi perfil</a>
          <a href="EntrenadorRutinas.jsp">Ver socios y crear Rutinas</a>     
          <a href="RegistrarPago.jsp">Registrar pagos</a>
      </section>
      </div>
    </div>
    <script src="js/script.js"></script>
    
    <script>
        function cerrarVentana(){
            window.open('Login.jsp');
        window.close();
    }
    </script>
    </body>
</html>
