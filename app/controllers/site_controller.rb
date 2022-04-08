class SiteController < ApplicationController
    #skip_before_action :login_check, only:[:index]
    include SessionsHelper
    def index
        gon.login_check = login?
        
    end

    def login?
        if current_user
            return true
        else
            return false
        end
    
    end
    def logged_in?
        if current_user #helper method written in application_contoller
            session[:user_id] = @current_user.id
            render json: { logged_in: true, user: @current_user ,session: session[:user_id]}
        else
           
            render json: { logged_in: false, message: 'ユーザーが存在しません' ,session: session[:user_id]}
        end
    end

    def logout
        session[:user_id] = nil
        render json: {logged_in: false, user: nil, session: nil}

    end
end