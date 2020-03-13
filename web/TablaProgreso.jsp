<%-- 
    Document   : TablaProgreso
    Created on : 21/02/2020, 02:52:13 PM
    Author     : Liliana
--%>

<%@page import="conexiones.Rutina"%>
<%@page import="conexiones.Progresos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosProgreso.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
           <link href="css/estilosCerrarSesion.css" type="text/css" rel="stylesheet">
    <title>MI PROGESO</title>
    </head>
    <body id="loginBody">
        <%
        HttpSession validar=request.getSession();
        if (validar.getAttribute("id_persona")==null || validar.getAttribute("id_persona").equals("0"))
        {
            response.sendRedirect("Login.jsp");
        }
            String id_persona=validar.getAttribute("id_persona").toString();
            Progresos pos = new Progresos();
            String clienteid=String.valueOf(validar.getAttribute("id_persona"));
            pos.setId_cliente(clienteid);
        %>
        <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <!--
            <li class="menu__item"><a href="ModificarSocio.jsp" class="menu__link">Mi perfil</a></li>        
            <li class="menu__item"><a href="SocioRutinas.jsp" class="menu__link ">Ver Rutinas</a></li>
            <li class="menu__item"><a href="RegistrarProgreso.jsp" class="menu__link select">Mi Progreso</a></li>
            <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
            -->
          </ul>
        </nav>
      </div>
    </header>
        <div class="contenedor">
          <table>
            <tr>
                <th colspan="6">MI PROGRESO</th>
            </tr>
             <tr>
                 <td>Fecha</td>
                 <td>Peso</td>
                 <td>Altura</td>
             </tr>
             <%
                for(Progresos p : pos.obtenerProgresos()){
                      System.out.println(p.getFecha_captura()+p.getPeso()+p.getAltura());
             %>
             <tr>
                 <td><%=p.getFecha_captura()%></td>
                 <td><%=p.getPeso()%></td>
                 <td><%=p.getAltura()%></td>
             </tr>
             <%
                 }
             %>
         </table>
         <a href="#" onclick="window.close()" id="btnRutinas">Cerrar Ventana</a>
      </div>
    </body>
</html>
