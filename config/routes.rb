Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  post '/login', to: 'login#login'
  resources :stops do
    member do
      delete :delete_image_attachment
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: %i[create show update] 
      resources :stops, only: %i[show update]
      get 'users/:user_id/last_trip', to: 'trips#last_trip'
    end
  end
end


