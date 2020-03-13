<%-- 
    Document   : SocioRutinas
    Created on : 5/02/2020, 09:45:29 AM
    Author     : LuisAngel
--%>

<%@page import="conexiones.Rutina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet">  
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosSocio.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
           <link href="css/estilosCerrarSesion.css" type="text/css" rel="stylesheet">
    <title>Rutinas de la Semana</title>
    <script src="http://code.jquery.com/jquery-1.12.1.js"></script>
    </head>
    <body id="loginBody">
        <%
          HttpSession validar=request.getSession();
        if (validar.getAttribute("id_persona")==null || validar.getAttribute("id_persona").equals("0"))
        {
            response.sendRedirect("Login.jsp");
        }

    Rutina r= new Rutina();
    String id_socio = validar.getAttribute("id_persona").toString();
    r.setId_cliente(id_socio);
    r.verRutinasSocios();
    %>
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="ModificarSocio.jsp" class="menu__link">Mi perfil</a></li>        
            <li class="menu__item"><a href="SocioRutinas.jsp" class="menu__link select">Ver Rutinas</a></li>
            <li class="menu__item"><a href="RegistrarProgreso.jsp" class="menu__link">Mi Progreso</a></li>
            <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
          </ul>
        </nav>
      </div>
    </header>
     
      <div class="contenedor" id="dias">
      <h2 class="section__titulo">RUTINAS DE LA SEMANA</h2>
      <form method="get"  action="SocioRutinas.jsp">
      <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Lunes</h2>
           <textarea name="areaLunes" class="info__img" disabled><%=r.getLunes()%></textarea>
           <a href="#" class="lunes">Escuchar</a>
            <audio src="" hidden class="speech"></audio><br>
          </article>

          <article class="info__columna">
           <h2 class="info__titulo">Martes</h2>
            <textarea name="areaMartes" class="info__img" disabled><%=r.getMartes()%></textarea>
            <a href="#" class="martes">Escuchar</a>
        <audio src="" hidden class="speech"></audio><br>
          </article>
          <article class="info__columna">
              <h2 class="info__titulo">Mi&eacute;rcoles</h2>
            <textarea name="areaMiercoles" class="info__img" disabled><%=r.getMiercoles()%></textarea>
            <a href="#" class="miercoles">Escuchar</a>
        <audio src="" hidden class="speech"></audio><br>
          </article>
               </section>
          <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Jueves</h2>
            <textarea name="areaJueves" class="info__img" disabled><%=r.getJueves()%></textarea>
            <a href="#" class="jueves">Escuchar</a>
        <audio src="" hidden class="speech"></audio><br>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Viernes</h2>
            <textarea name="areaViernes" class="info__img" disabled><%=r.getViernes()%></textarea>
            <a href="#" class="viernes">Escuchar</a>
        <audio src="" hidden class="speech"></audio><br>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Sábado</h2>
            <textarea name="areaSabado" class="info__img" disabled><%=r.getSabado()%></textarea>
            <a href="#" class="sabado">Escuchar</a>
        <audio src="" hidden class="speech"></audio><br>
          </article>
        </section>
            <input type="submit" id="btn" value="¡Rutina Realizada!" name="btnRealizado">
                </form>
    </div>
    <script src="js/script.js"></script>
    <script src="js/speech.js"></script>
  </body>
       <%
       if (request.getParameter("btnRealizado")!=null)
       {
          r.setId_cliente(id_socio);
          r.eliminarRutina();
          response.sendRedirect("menuSocio.jsp");
       }
       
       
       %>
           <%
        if(request.getParameter("btnCerrar")!=null){
            validar.invalidate();
            //validar.removeAttribute("id_persona");
            response.sendRedirect("Login.jsp");
        }
    %>
</html>
