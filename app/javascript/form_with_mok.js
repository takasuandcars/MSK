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
       $('#received_form') .slideToggle("fast");
    });
    
});