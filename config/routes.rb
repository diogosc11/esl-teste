Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/' => 'devise/sessions#new'
  end

  get '/reserves' => 'reserves#index', as: :user_root
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
