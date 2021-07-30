class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :login_check
    
    def login_check
        if !logged_in?
            redirect_to root_url
        end
    end
end
