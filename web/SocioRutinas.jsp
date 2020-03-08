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
    <title>Rutinas de la Semana</title>
    </head>
    <body id="loginBody">
        <%
            HttpSession validar=request.getSession();

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
            <li class="menu__item"><a href="ModificarPersona.jsp" class="menu__link">Mi perfil</a></li>        
            <li class="menu__item"><a href="SocioRutinas.jsp" class="menu__link select">Ver Rutinas</a></li>
            <li class="menu__item"><a href="RegistrarProgreso.jsp" class="menu__link">Mi Progreso</a></li>
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
           <textarea name="" class="info__img" disabled><%=r.getLunes()%></textarea>
          </article>

          <article class="info__columna">
           <h2 class="info__titulo">Martes</h2>
            <textarea name="" class="info__img" disabled><%=r.getMartes()%></textarea>
          </article>
          <article class="info__columna">
              <h2 class="info__titulo">Mi&eacute;rcoles</h2>
            <textarea name="" class="info__img" disabled><%=r.getMiercoles()%></textarea>
          </article>
               </section>
          <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Jueves</h2>
            <textarea name="" class="info__img" disabled><%=r.getJueves()%></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Viernes</h2>
            <textarea name="" class="info__img" disabled><%=r.getViernes()%></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Sábado</h2>
            <textarea name="" class="info__img" disabled><%=r.getSabado()%></textarea>
          </article>
        </section>
            <input type="submit" id="btn" value="¡Rutina Realizada!" name="btnRealizado">
                </form>
    </div>
    <script src="js/script.js"></script>
  </body>
       <%
       if (request.getParameter("btnRealizado")!=null)
       {
          r.setId_cliente(id_socio);
          r.eliminarRutina();
          response.sendRedirect("menuSocio.jsp");
       }
       
       
       %>
</html>
