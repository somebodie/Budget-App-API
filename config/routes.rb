Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :destroy] do
    resources :events do
      resources :items, shallow: true
    end
    collection do
      post '/login', to: 'users#login'
    end
  end
end


# Prefix Verb   URI Pattern                                      Controller#Action
# user_event_items GET    /users/:user_id/events/:event_id/items(.:format) items#index
#        POST   /users/:user_id/events/:event_id/items(.:format) items#create
#   item GET    /items/:id(.:format)                             items#show
#        PATCH  /items/:id(.:format)                             items#update
#        PUT    /items/:id(.:format)                             items#update
#        DELETE /items/:id(.:format)                             items#destroy
# user_events GET    /users/:user_id/events(.:format)                 events#index
#        POST   /users/:user_id/events(.:format)                 events#create
# user_event GET    /users/:user_id/events/:id(.:format)             events#show
#        PATCH  /users/:user_id/events/:id(.:format)             events#update
#        PUT    /users/:user_id/events/:id(.:format)             events#update
#        DELETE /users/:user_id/events/:id(.:format)             events#destroy
# login_users POST   /users/login(.:format)                           users#login
#  users POST   /users(.:format)                                 users#create
#   user GET    /users/:id(.:format)                             users#show
#        DELETE /users/:id(.:format)                             users#destroy
