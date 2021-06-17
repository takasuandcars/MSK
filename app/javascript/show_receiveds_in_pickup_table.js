/*global $*/

document.addEventListener("turbolinks:load" ,function () {
    
    $('.btn-receiveds').on("click", function(){
       var insideBox = $(this).closest(".tr_box").next('.inside_table_box');
       if (insideBox.is(':visible')){
           insideBox.slideUp("fast");
           $(this).text("▶")
        }else{
            insideBox.slideDown("fast");
            $(this).text("▽")
        }

    });
    

});