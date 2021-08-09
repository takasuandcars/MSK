//$(function(){
//  $(".btn").click(function(){
//  
//      $("h1").css("color","red");
//       
//    });
//});

/*global $*/

document.addEventListener("turbolinks:load" ,function () {
    
    $('#received_button').on("click", function(){
       $('#received_form').slideToggle("fast");
       $('#pickup_request_form').hide();
       
    });
    
    $('#pickup_request_button').on("click", function(){
       $('#pickup_request_form').show();
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