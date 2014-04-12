RailsPadrao::Application.routes.draw do


  resources :categorias


  resources :custos

  resources :arquivos


  resources :cursos do
    member do
      get :download
    end
  end


  root :to => 'application#home'
  authenticated :user do
    root :to => 'application#home'
  end
  resources :noticias do
    member do
      get :like
      get :dislike
      get :remover_voto
      post :criar_comentario
    end

    collection do
      get :feed
      get :buscar_tag
    end
  end

  devise_for :users do
    get 'users/:id/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'

  end

  resources :users do
    collection do
      get 'novo_usuario_manual'
      post 'cria_usuario_manualmente'
    end
  end

  resource :users, :only => [:edit] do
    member do
      post ':id/atualizar' => 'users#atualiza_usuario_com_senha', :as => "atualiza_usuario_com_senha"
    end
  end

  resources :roles do
    collection do
      get 'associar_permissao'
    end
  end

  resources :permissions

  resources :permission_role do
    collection do
      post 'remove_permissao_ajax'
      post 'adiciona_permissao_ajax'
    end
  end

  resources :fases do
    collection do
      post 'pesquisar'
    end

  end


end