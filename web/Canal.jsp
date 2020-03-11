<%-- 
    Document   : Canal
    Created on : 29/01/2020, 04:57:10 PM
    Author     : LuisAngel
--%>

<%@page import="conexiones.Inscripciones"%>
<%@page import="conexiones.Rutina"%>
<%@page import="conexiones.Personas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    <%
        Personas people=new Personas();
    String curp=request.getParameter("txtUsuarioLogin");
    String pass=request.getParameter("txtPassLogin");
    people.setCurp(curp);
    people.setPasswd(pass);
    people.validarUsuario();
    people.extraerId();
    //people.getId_persona();
    String id=people.getId_persona();
    request.getSession().setAttribute("id_persona", people.getId_persona());
    Inscripciones i = new Inscripciones();
    i.setId_cliente(id);
    i.extraerFechas();
    /*String inicio=i.getFecha_inicio();
    String fin=i.getFecha_fin();
    i.setFecha_inicio(inicio);
    i.setFecha_fin(fin);
    //i.extraerVigencia();*/
    String dias=String.valueOf(i.getDias());
    //int d=i.getDias();
    Integer dia= new Integer(i.getDias());
    
    
    if (people.getTipo_usuario()==1){
        response.sendRedirect("menuEntrenador.jsp");
        }else if (people.getTipo_usuario()==0)
        {
          if (dia >0)
          {
              response.sendRedirect("menuSocio.jsp");
          }
          else {
              response.sendRedirect("Aviso.jsp");
          }
        //response.sendRedirect("menuSocio.jsp");
        }
    /*if (dia == null)
    {
           response.sendRedirect("Aviso.jsp");
    }
    else {
        if (i.getDias() >0)
        {
        if (people.getTipo_usuario()==1){
        response.sendRedirect("menuEntrenador.jsp");
        }else if (people.getTipo_usuario()==0)
        {
        response.sendRedirect("menuSocio.jsp");
        }
        }
        else{
            response.sendRedirect("Aviso.jsp");
        }
    }*/
    
    /*if (people.getTipo_usuario()==1){
        response.sendRedirect("menuEntrenador.jsp");
    }else if (people.getTipo_usuario()==0)
    {
        response.sendRedirect("menuSocio.jsp");
    } */
    
    //System.out.println(p.getTipo_usuario());
    %>
</html>

