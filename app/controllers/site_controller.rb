class SiteController < ApplicationController
    
    skip_before_action :login_check, only:[:index]
    def index
    end
end