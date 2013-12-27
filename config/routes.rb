RailsPadrao::Application.routes.draw do


  root :to => 'application#home'
  authenticated :user do
    root :to => 'application#home'
  end

  resources :noticia

  devise_for :users
  resources :users



end