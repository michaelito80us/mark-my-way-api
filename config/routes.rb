Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


post '/login', to: 'login#login'

namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: %i[create show update]
      resources :stops, only: %i[show]

    end
  end
end
