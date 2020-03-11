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
            HttpSession validar=request.getSession();
            String id_persona=validar.getAttribute("id_persona").toString();
            Progresos p = new Progresos();
            String clienteid=String.valueOf(validar.getAttribute("id_persona"));
            p.setId_cliente(clienteid);
        //p.obtenerProgresos();
        %>
        <div class="contenedor">
            <h1><%=id_persona%></h1>
            
          <table>
            <tr>
                <th colspan="6">SOCIOS</th>
            </tr>
             <tr>
                 <td>Fecha</td>
                 <td>Peso</td>
                 <td>Altura</td>
             </tr>
             <%
                 //Personas p = Personas new
                 for (Progresos datos : p.obtenerProgresos())
                 {
                     System.out.println(datos.getFecha_captura()+datos.getPeso()+datos.getAltura());
             %>
             <tr>
                 <td><%=datos.getFecha_captura()%></td>
                 <td><%=datos.getPeso()%></td>
                 <td><%=datos.getAltura()%></td>
             </tr>
             <%
                 }
             %>
         </table>
      </div>
    </body>
</html>
