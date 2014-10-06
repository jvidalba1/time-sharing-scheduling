TimeSharingScheduling::Application.routes.draw do

  resources :users, except: [:show, :destroy] do
    collection do
      get "confirm_page"
    end
  end

  root 'users#new'

end
