var btnMenu = document.getElementById('btn-menu');
var nav = document.getElementById('nav');
btnMenu.addEventListener('click', function(){
  nav.classList.toggle('mostrar');
});


function Cambiar(){
    if(document.getElementById('chec').checked) {
        document.getElementById('btn').readOnly = false;
    } 
    else {
        document.getElementById('btn').readOnly = true;
    } 
}
function mostrarElementos1(){
    
    var x=document.getElementById("tablaProgreso");
    if(x.style.display==="block"){
       x.style.display="none";
       }else{
           x.style.display="block";
       }
}
