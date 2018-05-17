Rails.application.routes.draw do
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :pages
  get '/carts/show' => 'carts#show', as: :mycart
  get '/buildbox' => 'pages#index'
  get '/delivery' => 'pages#delivery'
  get '/confirmation' => 'pages#confirmation'
  get 'pages/secret'
	root to: 'users#home'
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'

	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
