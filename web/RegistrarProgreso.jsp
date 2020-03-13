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
    <title>Registrar Progreso</title>
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
        <h1 style="display: none;"><%=id_persona%></h1>
        
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="ModificarSocio.jsp" class="menu__link">Mi perfil</a></li>        
            <li class="menu__item"><a href="SocioRutinas.jsp" class="menu__link ">Ver Rutinas</a></li>
            <li class="menu__item"><a href="RegistrarProgreso.jsp" class="menu__link select">Mi Progreso</a></li>
            <li class="menu__item"><form id="btnSesion"><input type="submit" value="Cerrar Sesion" class="menu__link" name="btnCerrar"/></form></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
          <form action="">
          <h1>REGISTRA TU PROGRESO!</h1>
          <input type="text" name="idAyuda" value="<%=validar.getAttribute("id_persona")%>" disabled><br>
          Altura Actual:
          <input type="text" name="txtAltura">cm.<br>
          Peso Actual:<input type="text"  name="txtPeso">Kg.
          <input type="submit" value="Registrar" id="btnIngresar" name="guardarProgreso">
      </form>
          <!--<input onclick="mostrarElementos1" id="btnRutinas" value="MOSTRAR PROGRESO">-->
          <a href="TablaProgreso.jsp" id="btnRutinas" target="_blank">MOSTRAR PROGESO</a>
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
    <%
        if (request.getParameter("guardarProgreso")!=null)
        {
            String altura=request.getParameter("txtAltura");
            String peso=request.getParameter("txtPeso");
            double alt=Double.parseDouble(altura);
            double pes=Double.parseDouble(peso);
            pos.setAltura(alt);
            pos.setPeso(pes);
            pos.registrarProgreso();
            
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

