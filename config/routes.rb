Rails.application.routes.draw do

	root 'users#index'

	resources :users, :except => [:destroy, :update, :edit] do
		collection do
			get :departments_selects
			get '/thankyou' => 'thankyou#index'
		end
	end

	namespace :admin do
		resources :users, :except => [:show]
		resources :faculties
		resources :departments
  end

end
