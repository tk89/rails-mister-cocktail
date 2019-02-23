Rails.application.routes.draw do
  get 'review/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create, :new]
    resources :review, only: [:create, :new]
  end
  resources :doses, only: [:destroy]
end
