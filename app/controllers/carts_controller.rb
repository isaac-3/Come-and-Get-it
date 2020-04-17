class CartsController < ApplicationController
    
    def index
        @user = User.find_by(id: session[:user_id])
        @carts = @user.carts
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
        @current_cart = @user.carts.last
        @item_count = Hash.new(0)
        @items = @current_cart.orders.map { | o | o.menu_item.name }
        @items.each do |i| @item_count[i] += 1 end 
        @total_cart_value = @current_cart.orders.map { | o | o.menu_item.price }.sum
    end

    def delete
        @cart = Cart.find(params[:id])
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_back fallback_location: @user
    end

    def checkout
        @user = User.find_by(id: params[:id])
        @cart = @user.carts.last
    end

    def checkout_clear
        @user = User.find_by(id: params[:id])
        @cart = @user.carts.last
        if @cart.orders.empty?
            flash[:error_empty] = "Your cart is empty!"
            redirect_to "/carts/#{session[:user_id]}"
        else
            @cart = nil
            if @cart == nil
                @cart = Cart.create({
                    user_id: session[:user_id]
                })
            end 
            flash[:purchase] = "Thank you for your purchase!"
            redirect_to "/restaurants"    
        end
    end

end