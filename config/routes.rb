TimeSharingScheduling::Application.routes.draw do

  resources :users, except: [:show, :destroy] do
    collection do
      get "confirm_page"
      get "email_confirmed"
    end

    resources :reservations, only: [:new, :create, :index], shallow: true do
      member do
        get "confirmation"
      end
      get "rating"
      patch "update_rating"
    end
  end

  root 'users#new'

end
