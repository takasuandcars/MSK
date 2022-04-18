class ApplicationController < ActionController::Base
    include SessionsHelper
   before_action :login_check
   skip_before_action :verify_authenticity_token
   helper_method :login!, :current_user
    
    def login_check
         if current_user.nil?
            redirect_to root_url
         end
         
    end


#copy from the site for login using react



    def login!
        session[:user_id] = @user.id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


#end of the copy


end
