Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
   }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # ================ここをネスト(入れ子)した形に変更
  resources :users, :only => [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  #======================================
  resources :goals do
      resources :tasks, only: [:create,:destroy]
      resources :goal_comments, only: [:create,:destroy]
       resource :favorites, only: [:create, :destroy]
  end
  resources :rankings, :only => :index

  root "homes#top"
  get "home/about" => "homes#about"
  post '/goals/:goal_id/tasks/:id/toggle' => 'tasks#toggle'
  get '/search' => 'search#search', as: 'search'

end