Rails.application.routes.draw do
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # unauthenticated do
  #   root "users#home"
  # end
  devise_scope :user do
    authenticated  do
      root to: 'groups#index'
      # root 'groups#index'
   end

  unauthenticated do
      root to: 'users#home', as: 'unauthenticated_root'
  end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users, only: [:home]
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :entity, only: [:index, :new, :show, :create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
