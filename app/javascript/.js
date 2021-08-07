/*global $*/

$(document).on('turbolinks:load', function () {
    // なぜか↓の$(".table")を$(document)にすると動かない、、
    $(".table").on("click",".btn-receiveds",function(){
       var insideBox = $(this).closest(".tr_box").next('.inside_table_box_background');
       if (insideBox.is(':visible')){
           insideBox.slideUp("fast");
           $(this).text("▶")
        }else{
            insideBox.slideDown("fast");
            $(this).text("▽")
        }

    });
    

});