Rails.application.routes.draw do

  root 'home#top'
	get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

	resources :users, except: [:new, :create] do
		collection do
			get :departments_select
			get :thanks
		end
	end

	namespace :admin do
		resources :users, :except => [:show]
		resources :faculties
		resources :departments
    resources :circles
  end

end
