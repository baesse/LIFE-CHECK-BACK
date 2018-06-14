Rails.application.routes.draw do

  
  resources :histories
  resources :cupoms
  resources :check_ativides
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :publications
      resources :check_ativides
      resources :cupoms
      # models auth
      resources :users, except: [:edit, :new, :index, :destroy], shallow: true do
        member do
          put :password
          put :register_device
          post :checked_list
          post :get_cupom
        end
        collection do
          namespace :auth do
            put 'omniauth/:provider' => 'omniauth#all'
            patch 'omniauth/:provider' => 'omniauth#all'
            post 'sign_in' => 'sessions#create'
            delete 'sign_out' => 'sessions#destroy'
          end
          post :reset_password
        end
      end

    end
  end


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
