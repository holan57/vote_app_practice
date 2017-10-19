Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "candidates#index"
  resources :candidates do
    member do
      post :vote
    end
  end

end
