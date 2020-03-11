<%-- 
    Document   : index
    Created on : 7/02/2020, 02:24:01 PM
    Author     : ROGELIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
    <title>Inicio</title>
    </head>
    <body>
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
                        <li class="menu__item"><a href="index.jsp" class="menu__link select">Inicio</a></li>
              <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrate</a></li>
              <li class="menu__item"><a href="Login.jsp" class="menu__link">Inicia Sesi&oacute;n</a></li>
              <li class="menu__item"><a href="Ubicacion.jsp" class="menu__link ">Ubicaci&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <img src="img/gymBanner.jpg"alt="">
      <div class="contenedor">
        <h2 class="banner__titulo">Ven y cumple tus sueños</h2>
        <p class="banner__txt">Entrena con nosotros y alcanza tus sueños</p>
      </div>
    </div>
    <main class="main">
      <div class="contenedor">
        <section class="info">
          <article class="info__columna">
            <img src="img/art.jpg" alt="" class="info__img">
            <h2 class="info__titulo">Registrate!</h2>
            <p class="info__txt">Hazte socio creando una cuenta y ponte en forma. <a href="#" style="color: white;">Crear cuenta</a></p>
          </article>
          <article class="info__columna">
            <img src="img/art.jpg" alt="" class="info__img">
            <h2 class="info__titulo">Instalaciones</h2>
            <p class="info__txt">Hecha un viztazo a nuestras instalaciones y animate a comenzar!</p>
          </article>
          <article class="info__columna">
            <img src="img/art.jpg" alt="" class="info__img">
            <h2 class="info__titulo">Contactanos</h2>
            <p class="info__txt">Si tienes dudas, <a href="#" style="color: white">Haz clic aqu&iacute;</a> para contactarnos</p>
          </article>
        </section>
        <section class="cursos">
          <h2 class="section__titulo">Nuestros servicios</h2>
          <div class="cursos__columna">
            <img src="img/pesas.jpg" alt="" class="cursos__img">
            <div class="cursos__descripcion">
              <h2 class="cursos__titulo">Regaderas</h2>
              <div class="cursos__txt">Ofrecemos servicios de regaderas y vestidores.</div>
            </div>
          </div>
          <div class="cursos__columna">
            <img src="img/pesas.jpg" alt="" class="cursos__img">
            <div class="cursos__descripcion">
              <h2 class="cursos__titulo">Pesas</h2>
              <div class="cursos__txt">Contamos con un &aacute;rea de pesas y equipo especializado.</div>
            </div>
          </div>
          <div class="cursos__columna">
            <img src="img/pesas.jpg" alt="" class="cursos__img">
            <div class="cursos__descripcion">
              <h2 class="cursos__titulo">Rutinas especializadas</h2>
              <div class="cursos__txt">Contamos con entrenadores especializados para guiarte en tus objetivos.</div>
            </div>
          </div>
          <!--<div class="cursos__columna">
            <img src="img/pesas.jpg" alt="" class="cursos__img">
            <div class="cursos__descripcion">
              <h2 class="cursos__titulo"></h2>
              <div class="cursos__txt">Nulla, cumque sunt laudantium blanditiis deserunt, error dolores vero iure.</div>
            </div>
          </div>-->
        </section>
        
      </div>
    </main>
    <footer class="footer">
      <div class="contenedor">
        <div class="social">
          <a href="#" class="icon-facebook"></a>
          <a href="#" class="icon-twitter"></a>
          <a href="#" class="icon-gplus"></a>
          <a href="#" class="icon-vine"></a>
        </div>
        <p class="copy">&copy;</p>
      </div>
    </footer>
    <script src="js/script.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>swal ("Bienvenido","    ","success",{buttons: false, timer: 3000,});</script>
  </body>
</html>
