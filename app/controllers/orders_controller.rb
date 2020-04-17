class OrdersController < ApplicationController

    before_action(:new )

    def index
        @orders = Order.all
    end

    def new
        @item = MenuItem.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        @cart = @user.carts.last
        if @cart == nil
            @cart = Cart.create({
                user_id: session[:user_id]
            })
        end 
    end

    def create
        quantity = params[:order][:quantity].to_i
        if quantity < 1 
            flash[:qty_error] = "Must Order At Least 1"
            redirect_to "/menu_items/#{params[:order][:menu_item_id]}/order"
        else
            quantity.times do 
                @order = Order.create({
                    user_id: session[:user_id],
                    menu_item_id: params[:order][:menu_item_id],
                    quantity: params[:order][:quantity],
                    cart_id: params[:order][:cart_id]
                })
            end
            redirect_to "/carts/#{session[:user_id]}"
        end
    end

    def show
        @order = Order.find(params[:id])
        @restaurant = Restaurant.find_by(id: @order.restaurant_id)
        @user = User.find_by(id: @order.user_id)
        @menu_item = MenuItem.find_by(id: @order.menu_item_id)
    end

    def delete
        byebug
        @order = Order.find(params[:id])
    end

    def destroy
        @order = Order.find(params[:id])
        if @order.cart_id == @cart.id
            @order.destroy
        end
        redirect_back fallback_location: @user
    end
    
end