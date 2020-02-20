Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [:create]
  end
end
