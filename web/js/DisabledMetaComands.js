$(document).ready(function () {
    //Disable cut copy paste
    $('body').bind('cut copy paste', function (e) {
        e.preventDefault();
        alert("Accion no permitida");
    });
   
    //Disable mouse right click
    $("body").on("contextmenu",function(e){
        alert("Accion no permitida");
        return false;
    });
});