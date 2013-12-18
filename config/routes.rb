Tj2Api::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resource  :sessions, only: [:create, :show, :destroy]
      resources :entries, only: [:index, :show]
      resources :activities, only: [:index, :show]

      root to: 'api#index'
    end
  end

  root to: 'home#index'

end
