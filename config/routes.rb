Rails.application.routes.draw do


  resources :products, only: [:index]
  resource :cart
  resources :order_items, only: [:create, :update, :destroy]
  resources :pages
  get '/cart/show' => 'carts#show', as: :mycart
  post 'cart/update' => 'deliveries#new'
  get '/buildbox' => 'pages#index'
  get '/delivery' => 'pages#delivery'
  get '/confirmation' => 'pages#confirmation'
  # post '/cart' => 'carts#show', as: :mycart


  get 'pages/secret'
	root to: 'users#home'
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'
  get '/users/account_profile' => 'users#account_profile', as: :account
  get '/pages/thanks' => 'pages#thanks'

  patch '/users/update' => 'users#update', as: :user

	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  resources :charges
  get 'deliveries/new' => 'deliveries#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
