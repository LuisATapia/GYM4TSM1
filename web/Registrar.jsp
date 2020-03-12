<%@page import="conexiones.Validaciones"%>
<%@page import="conexiones.Personas"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="https://file.myfontastic.com/t5tNwfwUapz4yDzK3B6sfe/icons.css" rel="stylesheet">
       <link href="img/pesas-icon.jpg" type="image/x-icon" rel="shortcut icon">
   <link rel="stylesheet" href="css/estilos.css">
       <link href="css/fontello.css" rel="stylesheet"> 
   <link rel="stylesheet" href="css/estilosRegistro.css">
    <title>Pagina</title>
     <script languague="javascript" type="text/javascript" src="js/validacionesJSP.js" </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <title>Registrate</title>
    </head>
    <body id="loginBody">
    <header class="header">
      <div class="contenedor">
        <h1 class="logo"><span class="icon-gym">GYM</span></h1>
        <span class="icon-menu" id="btn-menu"></span>
        <nav class="nav" id="nav">
          <ul class="menu">
              <li class="menu__item"><a href="index.jsp" class="menu__link">Inicio</a></li>
              <li class="menu__item"><a href="Registrar.jsp" class="menu__link select">Registrate</a></li>
              <li class="menu__item"><a href="Login.jsp" class="menu__link">Inicia Sesi&oacute;n</a></li>
              <li class="menu__item"><a href="Ubicacion.jsp" class="menu__link ">Ubicaci&oacute;n</a></li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="banner">
     <!--<img src="gymBanner.jpg"alt="">-->
      <div class="contenedor">
          <form id="reg" action="Registrar.jsp" method="post"  >
          <h1>Registrate</h1>
          <input type="text" placeholder="Nombre" name="txtNombre" required minlength="3" maxlength="30" onkeypress="return soloLetras(event)"onpaste="return false"><br>
          <input type="text" placeholder="Apellidos" name="txtApellidos" required minlength="3" maxlength="30"  onkeypress="return soloLetras(event)" onpaste="return false"><br>
          <input type="email" placeholder="Correo" name="txtCurp" required minlength="5" maxlength="40" onkeypress="return valEmail(valor)"><br>
          <!--<input type="text" placeholder="Experiencia" name="txtExpe">-->
          Experiencia:
          <select name="txtExpe">
                  <option>No tengo experiencia</option>
                  <option>1 mes</option>
                  <option>3 meses</option>
                  <option>6 meses</option>
                  <option>1 año</option>
                  <option>Más de un año</option>
              </select><br>         
          <textarea placeholder="Observaciones" name="txtObser" minlength="2" maxlength="100"  onpaste="return false" required  ></textarea><br>
          <input type="password" placeholder="Contraseña" minlength="10" maxlength="20" required onpaste="return false"><br>
          <input type="password" placeholder="Confirmar contraseña" name="txtPass" minlength="10" maxlength="20" required onpaste="return false"><br>
          <label for="chec">Entrenador:</label>
          <input type="checkbox" name="chec" id="chec" onchange="Cambiar();">
          <input type="text" placeholder="Palabra clave" id="btn" readonly name="txtClave">
          <div class="g-recaptcha" data-sitekey="6LdqFuAUAAAAAHdwBnYK5FpnCEp7PnwuPY-A4kFa"></div>
          <input type="submit" value="Registrar" id="btnRegistrar">
          <p><a href="login.jsp">Inicia sesi&oacute;n aqu&iacute;</a></p>
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
                }
            }
            %>
</html>