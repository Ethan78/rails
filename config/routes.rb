Asagao::Application.routes.draw do
	root to: "top#index"
	get "about" => "top#about", as: "about"
	get "lesson/:action(/:name)" => "lesson"
	resources :members do
		collection{get "search"}
	end
	resources :articles,only: [:index,:show]
	resource :session, only: [:create, :destroy]
	resource :account, only: [:show, :edit, :update]

	namespace :admin do
		root to: "top#index"
		resources :members,only: [:index, :show] do
			collection{get "search"}
		end
		resource :articles
	end
end
