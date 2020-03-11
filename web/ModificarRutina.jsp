<%-- 
    Document   : ModificarRutina
    Created on : 7/02/2020, 10:57:55 AM
    Author     : ROGELIO
--%>

<%@page import="conexiones.Rutina"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosEditarRutinas.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
    <title>Pagina</title>
    </head>
    <body id="loginBody">
    <header class="header">
      <% 
        HttpSession validar=request.getSession();
        if (validar.getAttribute("id_persona")==null)
        {
            response.sendRedirect("Login.jsp");
        }
        String cod=request.getParameter("id_socio");
        
        Rutina r= new Rutina ();
        r.setId_entrenador(validar.getAttribute("id_persona").toString());
        r.setId_cliente(cod);
        r.verRutinasSocios();
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        System.out.println(r.getId_cliente());
        %>
        
        <!--<h1><%=cod%></h1
        <h1><%=validar.getAttribute("id_persona")%></h1>-->
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
              <li class="menu__item"><a href="ModificarPersona.jsp"  class="menu__link ">Mi perfil</a></li>
              <li class="menu__item"><a href="EntrenadorRutinas.jsp"  class="menu__link">Ver socios</a></li>
              <li class="menu__item"><a href="RegistrarPago.jsp"  class="menu__link">Registrar pago</a></li>
              <li class="menu__item"><a href="#" class="menu__link" onclick="cerrarVentana();">Cerrar Sesi&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
      <body>
     <!--<img src="gymBanner.jpg"alt="">-->
     <div class="contenedor" id="dias1">
      <section class="info">
<form class="days" method="post" action="">
      <h2 class="section__titulo">Editar Rutinas</h2>
      <input type="text" placeholder="Folio del socio" name="txtSocio" value="<%=r.getId_cliente()%>" disabled>
      <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Lunes</h2>
           <textarea name="txtLunes" class="info__img"><%=r.getLunes()%></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Martes</h2>
            <textarea name="txtMartes" class="info__img"><%=r.getMartes()%></textarea>
          </article>
          <article class="info__columna">
              <h2 class="info__titulo">Mi&eacute;rcoles</h2>
            <textarea name="txtMiercoles" class="info__img"><%=r.getMiercoles()%></textarea>
          </article>
               </section>
          <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Jueves</h2>
            <textarea name="txtJueves" class="info__img"><%=r.getJueves()%></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Viernes</h2>
            <textarea name="txtViernes" class="info__img"><%=r.getViernes()%></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Sábado</h2>
            <textarea name="txtSabado" class="info__img"><%=r.getSabado()%></textarea>
          </article>
        </section>
        <input type="submit" id="btn" value="Registrar Rutinas" name="modificarRutina">
        </form>
    </div>    
    <script src="js/script.js"></script>
  </body>
          <%
          if (request.getParameter("modificarRutina")!=null)
          {
              String id_socio= request.getParameter("txtSocio");
              String newLunes = request.getParameter("txtLunes");
              String newMartes = request.getParameter("txtMartes");
              String newMiercoles = request.getParameter("txtMiercoles");
              String newJueves = request.getParameter("txtJueves");
              String newViernes = request.getParameter("txtViernes");
              String newSabado = request.getParameter("txtSabado");
              
              r.setId_entrenador(validar.getAttribute("id_persona").toString());
              r.setLunes(newLunes);
              r.setMartes(newMartes);
              r.setMiercoles(newMiercoles);
              r.setJueves(newJueves);
              r.setViernes(newViernes);
              r.setSabado(newSabado);
              r.modificarRutina();
              response.sendRedirect("EntrenadorRutinas.jsp");
          }
          %>
</html>