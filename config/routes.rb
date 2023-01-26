Rails.application.routes.draw do
  resources :posts, shallow: true do
    resources :comments, shallow: true do
      resources :replies
    end
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
  }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [ :index, :show ]
  # Defines the root path route ("/")
  root "posts#index"
end
