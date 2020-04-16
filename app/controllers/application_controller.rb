class ApplicationController < ActionController::Base
    skip_before_action(:verify_authenticity_token)
    # before_action(:check_login)
    # def check_login
    #     if(session[:user_id] == nil)
    #         redirect_to("/users/new")
    #     end
    # end
end
