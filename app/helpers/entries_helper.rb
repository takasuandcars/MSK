module EntriesHelper
  def entried?(user)
    entries = user.entries.where(room_id: @room.id)
    if entries.empty?
      false
    else
      true
    end
  end
end
