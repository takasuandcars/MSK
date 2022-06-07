class DirectMessageBroadJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast("chat-#{message.room_id}", { message: render_message(message) })
  end

  private

  def render_message(message)
    DirectMessagesController.render(
      partial: 'message',
      locals: { message: message }
    )
  end
end
