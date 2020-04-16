class UsersController < ApplicationController

    # skip_before_action(:check_login, only: [ :new, :create])

   def new
        @user = User.new
   end

   def create
    # byebug
        @user = User.create({
            username: params[:user][:username],
            password: params[:user][:password]
        })
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to ('/restaurants')
        else
            flash[:error_name] = "Username already exsist"
            redirect_to ('/login')
        end
        # session[:user_id] = @user.id
        # redirect_to ('/restaurants')
   end

   def show
        @user = User.find_by(id: session[:user_id])
    end

end


