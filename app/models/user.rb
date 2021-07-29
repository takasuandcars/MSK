class User < ApplicationRecord
    # validates :email, uniqueness: {case_sensitive: true}
    has_many :work_times
    before_create :qrno
    has_secure_password
    validates :password, presence: true, length: { minimum: 4 }
 
        def qrno
            self.qrcode = 7.times.map { SecureRandom.random_number(10) }.join.to_i
        end

    
end
