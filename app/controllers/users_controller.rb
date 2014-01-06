# encoding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource

  def index
#    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user.role.overpower?
      @user = User.find(params[:id])
    else
      @user = current_user
    end

    render "devise/registrations/edit"
  end

  def atualiza_usuario_com_senha
    @user = User.find(params[:id])
    if @user.update_with_password(params[:user])
      sign_in @user, :bypass => true
      flash.now[:notice] = "Seus dados foram alterados com sucesso."
      render "show"
    else
      render "devise/registrations/edit"
    end
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "Usuário #{@user.name} atualizado."
    else
      redirect_to users_path, :alert => "Não foi possível atualizar o usuário #{@user.name}. Erro: #{@user.errors.full_message.to_s}"
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Usuário #{user.name} removido."
    else
      redirect_to users_path, :notice => "Você não pode remover seu próprio usuário."
    end
  end
end