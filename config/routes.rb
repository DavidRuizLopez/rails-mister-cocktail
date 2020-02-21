Rails.application.routes.draw do
  root :cocktails
  resources :cocktails, except: [:index] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
end
