Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ingredients, :menu_items, :orders, :ratings, :restaurants, :users, :carts
  get '/checkout/:id', to: "orders#checkout"
  get '/checkout_clear/:id',to: 'orders#checkout_clear'
  get '/menu_items/:id/order', to: 'orders#new'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#handle_login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end

