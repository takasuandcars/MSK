


/* global $*/
$("#calendar").click(function() {
 var thisEl = $("#calendar").find('.fc-daygrid-day');
 var thisElText = thisEl.find('.fc-event-title');
 $(thisElText).closest(".fc .fc-daygrid-event-harness").css({'position' : ''});
 for(var i = 0; i < thisElText.length; i++){
     
     if(thisElText[i].textContent === "集"){$(thisElText[i]).closest(".fc-daygrid-event-harness").addClass("pickup-request-mark");}
     
 }
 
});