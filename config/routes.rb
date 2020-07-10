Rails.application.routes.draw do
  devise_for :users

  #ログアウトできなかったので追加記述して解決(devise～end)
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#top"
  get "home/about" => "homes#about"

end
