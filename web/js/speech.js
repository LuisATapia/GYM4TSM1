$(function(){
                $("a.lunes").on('click',function(e){
                    e.preventDefault();
                    var text= $("textArea[name=text]").val();
                    text = encodeURIComponent(text);
                    var url= "https://audio1.spanishdict.com/audio?lang=es&text="+text;                    
                    $("audio").attr('src',url).get(0).play();
                });
            });

