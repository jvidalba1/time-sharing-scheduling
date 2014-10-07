TimeSharingScheduling::Application.routes.draw do

  resources :users, except: [:show, :destroy] do
    collection do
      get "confirm_page"
    end

    resources :reservations, only: [:new, :create, :index] do
      member do
        get "confirmation"
      end
    end
  end

  root 'users#new'

end
