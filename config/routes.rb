RailsPadrao::Application.routes.draw do
  resources :noticia
  root :to => "home#index"

  authenticated :user do
    root :to => 'home#index'
  end

  devise_for :users
  resources :users
end