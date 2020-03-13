<%-- 
    Document   : RegistrarPago
    Created on : 3/02/2020, 08:34:00 AM
    Author     : LuisAngel
--%>

<%@page import="conexiones.Pagos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosPago.css">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
           <link href="css/estilosCerrarSesion.css" type="text/css" rel="stylesheet">
    <title>Registrar Pagos</title>
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
              <li class="menu__item"><a href="ModificarPersona.jsp" class="menu__link ">Mi perfil</a></li>
              <li class="menu__item"><a href="EntrenadorRutinas.jsp" class="menu__link">Ver socios</a></li>
              <li class="menu__item"><a href="RegistrarPago.jsp" class="menu__link select">Registrar pago</a></li>
              <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
      <form action="RegistrarPago.jsp" method="POST">
          <h1>Registrar Pago</h1>
          <input type="text" placeholder="Clave Usuario" name="txtUsuario">
          Monto:<input type="text" placeholder="Monto" name="txtMonto">
          <br>Paquete:
             <select name="txtTipo" id="">
             <option >-Seleccionar-</option>
             <option value="Visita">Visita</option>
             <option value="Semanal">Semanal</option>
             <option value="Mensual">Mensual</option>
              <option value="Anual">Anual</option> 
          </select>
          <input type="submit" value="Registrar" id="btnIngresar" name="GuardarPago">
      </form>
      </div>
    </div>
    <script src="js/script.js"></script>
    <%
        //if(request.getParameter("GuardarPago")!=null){
        String user=request.getParameter("txtUsuario");
        String monto=request.getParameter("txtMonto");
        String paquete=request.getParameter("txtTipo");
        //float paq=Float.parseFloat(paquete);
        Pagos pay=new Pagos();
        pay.setId_cliente(user);
        pay.setMonto(monto);
        pay.setPaquete(paquete);
        pay.registrarPago();
       //}
    %>
        <%
            if(request.getParameter("btnCerrar")!=null){
            validar.invalidate();
            //validar.removeAttribute("id_persona");
            response.sendRedirect("Login.jsp");
        }
    %>
  </body>
</html>
