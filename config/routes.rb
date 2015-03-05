Rails.application.routes.draw do
  resources :comments
  root to: "index#index"
end
