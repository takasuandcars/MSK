class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :login_check
    
    def login_check
         if current_user.nil?
            redirect_to root_url
         end
         
    end
end
