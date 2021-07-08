class User < ApplicationRecord
    # validates :email, uniqueness: {case_sensitive: true}
    
    before_create :qrno
    
 
        def qrno
            self.qrcode = 7.times.map { SecureRandom.random_number(10) }.join.to_i
        end

    
end
