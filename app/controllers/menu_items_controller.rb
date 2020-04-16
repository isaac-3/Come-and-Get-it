class MenuItemsController < ApplicationController
    def show
        @menu_item = MenuItem.find(params[:id])
        @avg_rating = @menu_item.ratings.map{|r| r.rating}.sum/@menu_item.ratings.length
    end
end