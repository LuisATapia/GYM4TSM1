//Validaciones Ana 
//
//
//Validacion de correo electronico
function validateMail(idMail)
{
	//Creamos un objeto 
	object=document.getElementById(idMail);
	valueForm=object.value;
 
	// Patron para el correo
	var patron=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
	if(valueForm.search(patron)==0)
	{
		//Mail correcto
		object.style.color="#000";
		return;
	}
	//Mail incorrecto
	object.style.color="#f00";
}

//Validacion para solo poner letras

function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }




function limpia() {
    var val = document.getElementById("miInput").value;
    var tam = val.length;
    for(i = 0; i < tam; i++) {
        if(!isNaN(val[i]))
            document.getElementById("miInput").value = '';
    }
}
//evita copiar y pegar
$(document).ready(function(){
  $("#bloquear").on('paste', function(e){
    e.preventDefault();
    alert('Esta acción está prohibida');
  })
  
  $("#bloquear").on('copy', function(e){
    e.preventDefault();
    alert('Esta acción está prohibida');
  })
})


//campos vacios 
function validarfor(){

var correo = document.getElementById("mail").value; 
var nom = document.getElementsByName("nombres")[0].value;
var rs = document.getElementsByName("razonsocial")[0].value;
var tel = document.getElementsByName("telefono")[0].value;
var cel = document.getElementsByName("celular")[0].value;
var coment = document.getElementsByName("comentarios")[0].value;

var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;


if ( !expr.test(correo) ){                                                            //COMPRUEBA MAIL
    alert("Error: La dirección de correo " + correo + " es incorrecta.");
    return false;
}

if ((correo == "") || (nom == "") || (rs == "") || (tel == "") || (cel == "") || (coment == "")) {  //COMPRUEBA CAMPOS VACIOS
    alert("Los campos no pueden quedar vacios");
    return true;
}

}



//validacion correo

function valEmail(valor){
    re=/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/
    if(!re.exec(valor))    {
        return false;
    }else{
        return true;
    }
}
function validarCaptcha(a){
    var response = grecaptcha.getResponse();
    if (response.length==0)
    {
    alert('Por favor Compruebe el captcha');
    return false;
    event.preventDefault();
    }else
    {
        return true;
    }
}
