<%-- 
    Document   : TablaProgreso
    Created on : 21/02/2020, 02:52:13 PM
    Author     : erik_
--%>

<%@page import="conexiones.Rutina"%>
<%@page import="conexiones.Progresos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <!--<link rel="stylesheet" href="css/estilosProgreso.css">-->
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession validar= request.getSession();
        String id_persona=validar.getAttribute("id_persona").toString();
        Progresos p= new Progresos();
        p.setId_cliente(id_persona);
        //p.obtenerProgresos();
        %>
        <div class="contenedor">
            <h1><%=id_persona%></h1>
            
          <table id="tablaProgreso">
              <tr>
                  <th>Fecha:</th>
                  <th>Peso:</th>
                  <th>Estatura:</th>
              </tr>
              <%
                  for(Progresos a :p.obtenerProgresos()){
                      System.out.println(a.getFecha_captura()+a.getPeso()+a.getAltura());
                  %>
              <tr>
                  <td><%=a.getFecha_captura()%></td>
                  <td><%=a.getPeso()%></td>
                  <td><%=a.getAltura()%></td>
              </tr>
                  <%
                      }
                    %>
          </table>
      </div>
    </body>
</html>
