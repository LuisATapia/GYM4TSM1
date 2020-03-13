<%-- 
    Document   : ModificarSocio
    Created on : 10/03/2020, 10:42:48 AM
    Author     : ROGELIO
--%>

<%@page import="conexiones.Validaciones"%>
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
           <link href="css/estilosCerrarSesion.css" type="text/css" rel="stylesheet">
    <title>Configurar Perfil</title>
    </head>
    <body id="loginBody">
        <%
        HttpSession validar=request.getSession();
        validar.getAttribute("id_persona");
        if (validar.getAttribute("id_persona")==null || validar.getAttribute("id_persona").equals("0"))
        {
            response.sendRedirect("Login.jsp");
        }
        Personas p=new Personas();
        String id_people = validar.getAttribute("id_persona").toString();
        p.setId_persona(id_people);
        p.mostrarInformacion();
        //System.out.println(p.getNombre()+p.getApellidos()+p.getObservaciones());
        %>
       
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
             <li class="menu__item"><a href="ModificarSocio.jsp" class="menu__link select">Mi perfil</a></li>        
            <li class="menu__item"><a href="SocioRutinas.jsp" class="menu__link">Ver Rutinas</a></li>
            <li class="menu__item"><a href="RegistrarProgreso.jsp" class="menu__link">Mi Progreso</a></li>
            <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
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
              <input type="password" placeholder="Nueva Contraseña" value="<%=p.getPasswd()%>" ><br>
          <input type="password" placeholder="Confirmar Nueva contraseña" value="<%=p.getPasswd()%>" name="txtNuevaPass"><br>
          <input type="submit" value="Guardar cambios" id="btnRegistrar" name="ModificarPersona">
      </form>
          <%
              Validaciones v=new Validaciones();
              if(request.getParameter("ModificarPersona")!=null){
              String nuevoNombre=request.getParameter("txtNuevoNombre");
                String nuevoApellido=request.getParameter("txtNuevoApellido");
                String nuevaObser=request.getParameter("txtNuevaObser");
                String nuevaPass=request.getParameter("txtNuevaPass");
               String ConfirmarNuevaPass=request.getParameter("txtNuevaPass");
                
                 if (v.soloN(nuevoNombre)==true && v.soloP(nuevoApellido) && v.validarContraseña(nuevaPass)==true){
               if (ConfirmarNuevaPass.equals(nuevaPass))
               {
                p.setNombre(nuevoNombre);
                p.setApellidos(nuevoApellido);
                p.setObservaciones(nuevaObser);
                p.setPasswd(nuevaPass);
                p.setId_persona(id_people);
                p.modificarPersona();
                response.sendRedirect("ModificarSocio.jsp");
             }else
               {
                   %><script>swal("Error","Las contraseñas no coinciden","error");</script><%
               }
            
                }else{
            %><script>swal("Error","Revise los campos","error");</script><%
            }
            
        }
          %>
      </div>
    </div>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/script.js"></script>
        <%
        if(request.getParameter("btnCerrar")!=null){
            validar.invalidate();
            //validar.removeAttribute("id_persona");
            response.sendRedirect("Login.jsp");
        }
    %>
  </body>
</html>

