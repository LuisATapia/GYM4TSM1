$(function(){
    $("a.lunes").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaLunes]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});
$(function(){
    $("a.martes").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaMartes]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});
$(function(){
    $("a.miercoles").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaMiercoles]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});
$(function(){
    $("a.jueves").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaJueves]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});
$(function(){
    $("a.viernes").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaViernes]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});
$(function(){
    $("a.sabado").on('click',function(e){
        e.preventDefault();
        var text= $("textArea[name=areaSabado]").val();
        text = encodeURIComponent(text);
        var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
        $("audio").attr('src',url).get(0).play();
    });
});