<%@page import="conexiones.Validaciones"%>
<%@page import="conexiones.Personas"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilos.css">
   <link rel="stylesheet" href="css/estilosRegistro.css">
    <title>Registrate</title>
    </head>
    <body id="loginBody">
    <header class="header">
      <div class="contenedor">
        <h1 class="logo">GYM</h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
            <li class="menu__item"><a href="index.jsp" class="menu__link select">Inicio</a></li>
              <li class="menu__item"><a href="Registrar.jsp" class="menu__link">Registrate</a></li>
              <li class="menu__item"><a href="Login.jsp" class="menu__link">Inicia Sesi&oacute;n</a></li>
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
          <input type="text" placeholder="Correo" name="txtCurp"><br>
          <!--<input type="text" placeholder="Experiencia" name="txtExpe">-->
          <p>Experiencia:</p>
          <select name="txtExpe">
                  <option>No tengo experiencia</option>
                  <option>1 mes</option>
                  <option>3 meses</option>
                  <option>6 meses</option>
                  <option>1 año</option>
                  <option>Más de un año</option>
              </select><br>         
          <textarea placeholder="Observaciones" name="txtObser"></textarea><br>
          <input type="password" placeholder="Contraseña"><br>
          <input type="password" placeholder="Confirmar contraseña" name="txtPass"><br>
          <label for="chec">Entrenador:</label>
          <input type="checkbox" name="chec" id="chec" onchange="Cambiar();">
          <input type="text" placeholder="Palabra clave" id="btn" readonly name="txtClave">
          <input type="submit" value="Registrar" id="btnRegistrar" name="btnReg">
              <p><a href="Login.jsp">Inicia sesi&oacute;n aqu&iacute;</a></p>
      </form>
      </div>
    </div>
    <script src="js/script.js"></script>
  </body>
    <%
        Validaciones v= new Validaciones();
        if (request.getParameter("btnReg")!=null)
        {
            if (v.validarNombre(request.getParameter("txtNombre"))==true)
            {
            %><script>alert('Ya la hicistes!');</script><%
                if(v.validarApellidos(request.getParameter("txtApellidos"))==true){
                    %><script>alert('Ya la hicistes 2!');</script><%
                        if(v.validarCorreo(request.getParameter("txtCurp"))==true){
                            %><script>alert('Ya la hicistes 3!');</script><%
                                if(v.validarContraseña(request.getParameter("txtPass"))==true){
                                    %><script>alert('Ya la hicistes 4!');</script><%
                                
       /* String nombre=request.getParameter("txtNombre");
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
                            
         */   
                            }
                        }
                    }
            }else if(v.validarNombre(request.getParameter("txtNombre"))==false){
        %><script>alert('Ya valiste madre!');</script><%
}
        }
            
            %>
</html>
