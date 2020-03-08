<%@page import="conexiones.Progresos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosProgreso.css">
    <title>Registrar Progreso</title>
    </head>
    <body id="loginBody">
        <%
            HttpSession validar=request.getSession();
            String id_persona=validar.getAttribute("id_persona").toString();
            Progresos pos = new Progresos();
            String clienteid=String.valueOf(validar.getAttribute("id_persona"));
            pos.setId_cliente(clienteid);
                         
        %>
        <h1 style="display: none;"><%=id_persona%></h1>
        <input type="text"  value="<%=id_persona%>" name="txtID">
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
          <form action="">
          <h1>REGISTRA TU PROGRESO!</h1>
          <input type="text" name="idAyuda" value="<%=validar.getAttribute("id_persona")%>"><br>
          Altura Actual:
          <input type="text" name="txtAltura">cm.<br>
          Peso Actual:<input type="text"  name="txtPeso">Kg.
          <input type="submit" value="Registrar" id="btnIngresar" name="guardarProgreso">
      </form>
          <input onclick="mostrarElementos1();" id="btnRutinas" value="MOSTRAR PROGRESO">
      </div>
     <div class="contenedor">
          <table id="tablaProgreso">
              <tr>
                  <th>Fecha:</th>
                  <th>Peso:</th>
                  <th>Estatura:</th>
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
</html>

