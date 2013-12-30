RailsPadrao::Application.routes.draw do


  root :to => 'application#home'
  authenticated :user do
    root :to => 'application#home'
  end

  resources :noticia



  devise_for :users do
    get 'users/:id/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'

  end
  resources :users

  resource :users, only: [:edit] do
    member do
      post ':id/atualizar' => 'users#atualiza_usuario_com_senha', :as => "atualiza_usuario_com_senha"
    end
  end



end