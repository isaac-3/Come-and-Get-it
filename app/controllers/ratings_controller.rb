class RatingsController < ApplicationController
    def new
        @cart = Cart.find_by(id: params[:format])
        @rating = Rating.new()
        # byebug
        # if  @user_id != nil
        #     @user_id = session[:user_id]
        #     @rating = Rating.new
        #     @menu_items = MenuItem.all
        # else
        #     @rating = Rating.new
        #     @menu_items = MenuItem.all
        #     @users = User.all
        # end
    end
    def create
        @rating = Rating.create({
            rating: params[:rating][:rating],
            menu_item_id: params[:rating][:menu_item_id],
            user_id: session[:user_id]
        })
        redirect_to "/users/#{session[:user_id]}"
    end
end