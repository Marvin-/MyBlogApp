Rails.application.routes.draw do

  resources :pages
  get "/:id" => "pages#show"
  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  get 'articles/from/:month' => 'articles#index', :as => 'articles/month'

  resources :tags
  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
