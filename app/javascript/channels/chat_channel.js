 /* global $*/
import consumer from "./consumer"
if(typeof gon === "undefined"){
  
  console.log("gon is not defined")
}else{

consumer.subscriptions.create({channel: "ChatChannel", id: gon.room_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected!!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});
}