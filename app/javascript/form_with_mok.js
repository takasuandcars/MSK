//$(function(){
//  $(".btn").click(function(){
//  
//      $("h1").css("color","red");
//       
//    });
//});

/*global $*/
$(document).ready(function(event) { 
    
    $('#received_button').on("click", function(){
       $('#pickup_request_form').show();
       
    });
    
    $('#pickup_request_button').on("click", function(){
       $('.create-new-data').show();
    });
    
    $('.show_button').on("click", function(){
        if($(this).hasClass('open')){
          $(this).text("▶︎");
          $(this).removeClass('open');
        } else {
            $(this).addClass('open');
            $(this).text("▽");
        }
      $(this).parent().find('.pickup_request_form').slideToggle("fast");
      
     
    });
    
});