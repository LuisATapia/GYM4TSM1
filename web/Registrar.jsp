<%@page import="conexiones.Personas"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosRegistro.css">
    <title>Pagina</title>
    </head>
    <body id="loginBody">
    <header class="header">
      <div class="contenedor">
        <h1 class="logo">GYM</h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="/" class="menu__link">Inicio</a></li>
            <li class="menu__item"><a href="cursos.html" class="menu__link">Cursos</a></li>
            <li class="menu__item"><a href="docentes.html" class="menu__link">Docentes</a></li>
            <li class="menu__item"><a href="contacto.html" class="menu__link select">Registrate</a></li>
            <li class="menu__item"><a href="contacto.html" class="menu__link">Inicia Sesi&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
          <form id="reg" action="Registrar.jsp" method="post">
          <h1>Registrate</h1>
          <input type="text" placeholder="Nombre" name="txtNombre"><br>
          <input type="text" placeholder="Apellidos" name="txtApellidos"><br>
          <input type="text" placeholder="CURP" name="txtCurp"><br>
          <input type="text" placeholder="Experiencia" name="txtExpe"><br>         
          <textarea placeholder="Observaciones" name="txtObser"></textarea><br>
          <input type="password" placeholder="Contraseña"><br>
          <input type="password" placeholder="Confirmar contraseña" name="txtPass"><br>
          <label for="chec">Entrenador:</label>
          <input type="checkbox" name="chec" id="chec" onchange="Cambiar();">
          <input type="text" placeholder="Palabra clave" id="btn" readonly name="txtClave">
          <input type="submit" value="Registrar" id="btnRegistrar">
          <p><a href="login.jsp">Inicia sesi&oacute;n aqu&iacute;</a></p>
      </form>
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
    <%
            String nombre=request.getParameter("txtNombre");
            String apellidos=request.getParameter("txtApellidos");
            String curp=request.getParameter("txtCurp");
            String exp=request.getParameter("txtExpe");
            String ob=request.getParameter("txtObser");
            String clave=request.getParameter("txtClave");
            String pass=request.getParameter("txtPass");
            
            Personas person=new Personas();
            person.setNombre(nombre);
            person.setApellidos(apellidos);
            person.setCurp(curp);
            person.setExperiencia(exp);
            person.setObservaciones(ob);
            person.setPalabra_clave(clave);
            person.setPasswd(pass);
            person.registrarPersona();
            
            //persona.registrarPersona();
            
            %>
</html>
