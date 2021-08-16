module EntriesHelper
    
    def entried?(user)
        entries = user.entries.where(room_id: @room.id)
        if entries.empty?
            return false
        else
            return true
        end
    end
        
end
