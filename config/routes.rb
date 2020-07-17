Rails.application.routes.draw do
  devise_for :users

  #ログアウトできなかったので追加記述して解決(devise～end)
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
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

  root "homes#top"
  get "home/about" => "homes#about"

end