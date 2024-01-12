Rails.application.routes.draw do
  resources :bars, only: %i[index] do
    collection do
      get :search
      post :search
    end
  end

  root "bars#index"
end
