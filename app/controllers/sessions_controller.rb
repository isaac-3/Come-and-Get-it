class SessionsController < ApplicationController

        # skip_before_action(:check_login, only: [ :login, :handle_login, :new ])

    def login
    end
 
    def handle_login
         user = User.find_by({username: params[:username]})
         if (user != nil && user.authenticate(params[:password])) 
            session[:user_id] = user.id
            redirect_to ('/restaurants')
         else
            flash[:login_error] = "Username Does Not Exit. Please Sign Up"
            redirect_to ('/login')
         end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login', notice: "Logged out!"
    end

end
