Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :merchants do
      resources :items, only: [:index]
      resources :invoices, only: [:index]
      resources :dashboard, only: [:index]
    end









  namespace :admin do
    controller :admin do
      get '/', action: :index
    end
    resources :merchants, only: [:index]
    resources :invoices, only: [:index]
  end
end
