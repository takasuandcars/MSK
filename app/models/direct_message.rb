class DirectMessage < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :room, required: false

  after_create_commit { DirectMessageBroadJob.perform_later(self) }
end
