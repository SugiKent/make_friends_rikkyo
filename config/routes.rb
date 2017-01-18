Rails.application.routes.draw do

	root 'users#index'

	resources :users, :except => [:destroy, :update, :edit]

	namespace :admin do
		resources :users, :except => [:show]
  end

end
