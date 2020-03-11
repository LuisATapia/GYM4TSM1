<%-- 
    Document   : ModificarPersona
    Created on : 3/02/2020, 04:15:35 AM
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
   <link rel="stylesheet" href="css/estiloEditarCliente.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
    <title>Configurar Perfil</title>
    </head>
    <body id="loginBody">
        <%
        HttpSession validar=request.getSession();
        Personas p=new Personas();
        String id_people = validar.getAttribute("id_persona").toString();
        p.setId_persona(id_people);
        p.mostrarInformacion();
        //System.out.println(p.getNombre()+p.getApellidos()+p.getObservaciones());
        %>
        <!--<h1>Folio: <%=id_people%></h1>
        <h1>Nombre: <%=p.getNombre()%></h1>-->
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
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
          <form id="reg" metod="get" action="ModificarPersona.jsp">
          <h1>Editar tus datos personales</h1>
          <input type="text" placeholder="Modificar nombre" name="txtNuevoNombre" value="<%=p.getNombre()%>"><br>
          <input type="text" placeholder="Modificar apellidos" name="txtNuevoApellido" value="<%=p.getApellidos()%>"><br>      
          <textarea placeholder="Modificar observaciones" name="txtNuevaObser" value=""><%=p.getObservaciones()%></textarea><br>
          <input type="password" placeholder="Nueva Contraseña" value="<%=p.getPasswd()%>"><br>
          <input type="password" placeholder="Confirmar Nueva contraseña" name="txtNuevaPass" value="<%=p.getPasswd()%>"><br>
          <input type="submit" value="Guardar cambios" id="btnRegistrar" name="ModificarPersona" >
      </form>
          <%
              if(request.getParameter("ModificarPersona")!=null){
              String nuevoNombre=request.getParameter("txtNuevoNombre");
                String nuevoApellido=request.getParameter("txtNuevoApellido");
                String nuevaObser=request.getParameter("txtNuevaObser");
                String nuevaPass=request.getParameter("txtNuevaPass");
               
                p.setNombre(nuevoNombre);
                p.setApellidos(nuevoApellido);
                p.setObservaciones(nuevaObser);
                p.setPasswd(nuevaPass);
                p.setId_persona(id_people);
                p.modificarPersona();
                response.sendRedirect("ModificarPersona.jsp");
              }
          %>
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
</html>
