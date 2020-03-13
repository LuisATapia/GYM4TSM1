<%-- 
    Document   : EntrenadorRutinas
    Created on : 29/01/2020, 09:59:56 PM
    Author     : LuisAngel
--%>

<%@page import="conexiones.Personas"%>
<%@page import="conexiones.Rutina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet">
       <link href="css/fontello.css" rel="stylesheet">
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosEntrenador.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
           <link href="css/estilosCerrarSesion.css" type="text/css" rel="stylesheet">
    <title>Registrar Rutina</title>
    </head>
    <body id="loginBody">
        <%
        /*Personas p= new Personas();
        String curp=request.getParameter("txtUsuarioLogin");
        String pass=request.getParameter("txtPassLogin");
        p.setCurp(curp);
        p.setPasswd(pass);
        p.extraerId();
        p.getId_persona();*/
        //HttpSession validar=request.getSession();
        
        HttpSession validar=request.getSession();
        validar.getAttribute("id_persona");
        if (validar.getAttribute("id_persona")==null)
        {
            response.sendRedirect("Login.jsp");
        }
        %>
        
        <!--<h1>Folio: <%=validar.getAttribute("id_persona")%></h1>-->
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
              <li class="menu__item"><a href="ModificarPersona.jsp"  class="menu__link ">Mi perfil</a></li>
              <li class="menu__item"><a href="EntrenadorRutinas.jsp" class="menu__link select">Ver socios</a></li>
              <li class="menu__item"><a href="RegistrarPago.jsp"  class="menu__link">Registrar pago</a></li>
              <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
          </ul>
        </nav>
      </div>
    </header>
     <!--<img src="gymBanner.jpg"alt="">-->
     <div class="contenedor" id="dias1">
      <h2 class="section__titulo">Lista de usuarios</h2>
      <section class="info">
        <form>
           <h2>Buscar socios</h2>
            <input type="text" placeholder="Folio del socio" name="txtBuscarSocio">
            <input type="submit" value="buscar" id="btn">
        </form>
         <table>
            <tr>
                <th colspan="6">SOCIOS</th>
            </tr>
             <tr>
                 <td>Folio</td>
                 <td>Nombre</td>
                 <td>Apellidos</td>
                 <td>Experiencia</td>
                 <td>Observaciones</td>
                 <td>Acciones</td>
             </tr>
             <%
                 //Personas p = Personas new
                 for (Personas p : new Personas().obtenerPersonas())
                 {
                     System.out.println(p.getId_persona()+p.getNombre()+p.getApellidos()+p.getExperiencia()+p.getObservaciones());
             %>
             <tr>
                 <td><%=p.getId_persona()%></td>
                 <td><%=p.getNombre()%></td>
                 <td><%=p.getApellidos()%></td>
                 <td><%=p.getExperiencia()%></td>
                 <td><%=p.getObservaciones()%></td>
                 <td><a href="ModificarRutina.jsp?id_socio=<%=p.getId_persona()%>">Modificar Rutina</a></td>
             </tr>
             <%
                 }
             %>
         </table>
        </section>
    </div>
      <div class="contenedor" 
      id="dias">
          <form class="days" method="post" action="EntrenadorRutinas.jsp">
      <h2 class="section__titulo">Rutinas diarias</h2>
      <input type="text" placeholder="Ingrese el folio del socio" name="txtSocio">
      <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Lunes</h2>
           <textarea name="txtLunes" class="info__img"></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Martes</h2>
            <textarea name="txtMartes" class="info__img"></textarea>
          </article>
          <article class="info__columna">
              <h2 class="info__titulo">Mi&eacute;rcoles</h2>
            <textarea name="txtMiercoles" class="info__img"></textarea>
          </article>
               </section>
          <section class="info">
          <article class="info__columna">
           <h2 class="info__titulo">Jueves</h2>
            <textarea name="txtJueves" class="info__img"></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Viernes</h2>
            <textarea name="txtViernes" class="info__img"></textarea>
          </article>
          <article class="info__columna">
           <h2 class="info__titulo">Sábado</h2>
            <textarea name="txtSabado" class="info__img"></textarea>
          </article>
        </section>
        <input type="submit" id="btn" value="Registrar Rutinas" name="registrarRutina">
        </form>
    </div>    
    <script src="js/script.js"></script>
  </body>
       <%
           if(request.getParameter("registrarRutina")!=null){
            String usuario=request.getParameter("txtSocio");
            String lunes=request.getParameter("txtLunes");
            String martes=request.getParameter("txtMartes");
            String miercoles=request.getParameter("txtMiercoles");
            String jueves=request.getParameter("txtJueves");
            String viernes=request.getParameter("txtViernes");
            String sabado=request.getParameter("txtSabado");
            String id_entrenador=String.valueOf(validar.getAttribute("id_persona"));
            
            Rutina r= new Rutina();
            r.setId_cliente(usuario);
            r.setId_entrenador(id_entrenador);
            r.setLunes(lunes);
            r.setMartes(martes);
            r.setMiercoles(miercoles);
            r.setJueves(jueves);
            r.setViernes(viernes);
            r.setSabado(sabado);
            
            r.registrarRutina();      
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

