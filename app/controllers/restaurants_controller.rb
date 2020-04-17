class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end
    def new
        @restaurant = Restaurant.new
    end
    def create
        @restaurant = Restaurant.create({
            name: params[:restaurant][:name]
        })
        redirect_to @restaurant
    end
    def show
        @restaurant = Restaurant.find(params[:id])
        @all_dishes = @restaurant.orders.map{|o| o.menu_item.name}
        @most_ordered = @all_dishes.max_by{|d| @all_dishes.count(d)}
        if @restaurant.ratings.length == 0
            @avg_rating = 0
        else
            @avg_rating = @restaurant.ratings.map{|r| r.rating}.sum/@restaurant.ratings.length
        end 
    end
end