Rails.application.routes.draw do

	root 'users#index'

	get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

	resources :users do
		collection do
			get :departments_select
			get :thanks
		end
	end

	namespace :admin do
		resources :users, :except => [:show]
		resources :faculties
		resources :departments
  end

end
