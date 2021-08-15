class User < ApplicationRecord
    # validates :email, uniqueness: {case_sensitive: true}
    has_many :work_times
    before_create :qrno
    has_secure_password
    validates :password, presence: true, length: { minimum: 4 }
    has_many :entries
    has_many :direct_messages
    has_many :rooms, through: :entries
 
        def qrno
            self.qrcode = 7.times.map { SecureRandom.random_number(10) }.join.to_i
        end

    
end
