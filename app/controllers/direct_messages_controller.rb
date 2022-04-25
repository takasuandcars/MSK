class DirectMessagesController < ApplicationController
  def create
    @message = current_user.direct_messages.new (params_new_message)
    @message.created_at = Time.now + 60 * 60 * 9
    @message.save

  end
  
  private
  def params_new_message
    params.require(:direct_message).permit(:content, :room_id)
  end
end
