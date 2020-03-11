<%-- 
    Document   : MapaLocal
    Created on : 11/03/2020, 01:47:21 PM
    Author     : LuisAngel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v3"></script>
    </head>
    <body>
        <h1>Mi ubicación</h1>
        <div id="mapa" style="width: 700px;height:500px;">
            Encuentranos
        </div>
        
        <script type="text/javascript">
            //NAMESPACE google.maps.algo
            var divMapa =document.getElementById("mapa");
            navigator.geolocation.getCurrentPosition(fn_ok,fn_mal);
            function fn_mal () {}
            function fn_ok ( rta ){
                var lat = rta.coords.latitude;
                var lon = rta.coords.longitude;
                
                var gLatLon = new google.maps.LatLng (lat , lon);
                var objConfig = {
                    zoom:13,
                    center: gLatLon
                 };
                var gMapa = new google.maps.Map(divMapa,objConfig);
                
                //MARKER
                var objConfigMarker ={
                    position:gLatLon,
                    map:gMapa,
                    title:"Estás Aquí"
                };
                var gMarker = new google.maps.Marker(objConfigMarker);
                
                var objConfigGYM ={
                    position: {lat: 19.645148, lng: -98.995745},
                    map: gMapa,
                    title: 'GYM'
                };
                var gMarkerGYM = new google.maps.Marker(objConfigGYM);
                
                var objHTML={
                    content:'<div style="height:150:px;width:300px"><h2>GYM</h2>\n\
                    <h3>Bienvenido Abierto de 8:00 a 21:00</h3></div>'
                };
                var gIW = new google.maps.InfoWindow(objHTML);
                google.maps.event.addListener(gMarkerGYM,'click',function (){
                    gIW.open(gMapa, gMarkerGYM);
                });
                var objConfigDR={
                  map:gMapa  
                };
                
                var objConfiDS={
                  origin: gLatLon,
                  destination:19.645148 -98.995745,//coor GYM
                  travelMode: google.maps.TravelMode.DRIVING
                };
                var ds= new google.maps.DirectionsService();//obtener coor
                
                var dr= new google.maps.DirectionsRender(objConfigDR);//traducir coor
                
                ds.route(objConfigDS, fnRutear);
                function fnRutear(resultados, status){
                    //Mostrar el camino
                    if ( status.equals('OK')){
                        dr.setDirections(resultados);
                    }
                }
            }
            
        </script>
        
    </body>
</html>
