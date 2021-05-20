class Received < ApplicationRecord
    belongs_to :pickup_request, required: false
end
