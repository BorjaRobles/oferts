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
  $("#curri_text_arrow").slideToggle('slow');
}

function curriclose(){
  $("#curriculum_text").slideUp("fast");    
  $("#curri_text_arrow").slideUp("fast");  
}

function buscadoropen(){
  $("#buscador_text").slideToggle('slow');
  $("#busq_text_arrow").slideToggle('slow');
}

function buscadorclose(){
  $("#buscador_text").slideUp("fast");    
  $("#busq_text_arrow").slideUp("fast");  
}
     
function welcomeopen(){
  $("#welcome_text").slideToggle('slow');    
  $("#welcome_text_arrow").slideToggle('slow');
}

function welcomeclose(){
  $("#welcome_text").slideUp("fast");  
  $("#welcome_text_arrow").slideUp("fast");  
}
