$(document).ready(function(){
    
    $("#bienvenido").hoverIntent({
	 over: welcomeopen, 
	 timeout: 500, 
	 out: welcomeclose
     });
    
    $("#buscador").hoverIntent({
	 over: buscadoropen, 
	 timeout: 500, 
	 out: buscadorclose
     });
    
        $("#curriculum").hoverIntent({
	 over: curriopen, 
	 timeout: 500, 
	 out: curriclose
     });
    
    
}); // close document.ready


function curriopen(){
     $("#curriculum_text").slideToggle('slow');
}
function curriclose(){
     $("#curriculum_text").slideUp("slow");    
}

function buscadoropen(){
     $("#buscador_text").slideToggle('slow');
}
function buscadorclose(){
     $("#buscador_text").slideUp("slow");    
}
     
function welcomeopen(){
     $("#welcome_text").slideToggle('slow');    
}

function welcomeclose(){
     $("#welcome_text").slideUp("slow");  
}
                
                

                
    
    
   