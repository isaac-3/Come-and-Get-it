class CartsController < ApplicationController
    
    def index
        @carts = Cart.all
    end 
    
    # def new
    #     @cart = Cart.new()
    # end

    def create
        @cart = nil
        @cart = Cart.create({
            user_id: session[:user_id]
        })
        redirect_to '/restaurants'
    end
    
    def show
        @user = User.find(session[:user_id])
        @cart = Cart.find_by(id: @user.carts.first.id)
    end

    def delete
        @cart = Cart.find(params[:id])
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_back fallback_location: @user
    end

end