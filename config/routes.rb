Rails.application.routes.draw do
  get 'config_store/index'
  root 'config_store#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
