# encoding: utf-8
class PermissionsController < ApplicationController
  load_and_authorize_resource

  def index
    @permissions = Permission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @permission }
    end
  end

  # GET /Permission/1
  # GET /Permission/1.json
  def show
    @permission = Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>@permission }
    end
  end

  # GET /Permission/new
  # GET /Permission/new.json
  def new
    @permission = Permission.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>@permission }
    end
  end

  # GET /Permission/1/edit
  def edit
    @permission = Permission.find(params[:id])
  end

  # POST /Permission
  # POST /Permission.json
  def create
    @permission = Permission.new(params[:permission])

    respond_to do |format|
      if @permission.save
        format.html { redirect_to permissions_path, :notice => "Permissão #{@permission.action} - #{@permission.subject_class} criada com sucesso." }
        format.json { render json =>@permission, status =>:created, location =>@permission }
      else
        format.html { render :action =>"new" }
        format.json { render json =>@permission.errors, status =>:unprocessable_entity }
      end
    end
  end

  # PUT /Permission/1
  # PUT /Permission/1.json
  def update
    @permission = Permission.find(params[:id])

    respond_to do |format|
      if @permission.update_attributes(params[:permission])
        format.html { redirect_to @permission, :notice => "Permissão atualizada com sucesso."}
        format.json { head :no_content }
      else
        format.html { render :action =>"edit" }
        format.json { render json =>@permission.errors, status =>:unprocessable_entity }
      end
    end
  end

  # DELETE /Permission/1
  # DELETE /Permission/1.json
  def destroy
    @permission = Permission.find(params[:id])
    nome = @permission.name
    respond_to do |format|
      if @permission.destroy
        format.html { redirect_to roles_path, :notice => "Permissão #{nome} removida com sucesso." }
        format.json { head :no_content }
      else
        format.html { redirect_to roles_path, :alert => "Erro ao remover grupo #{nome}: #{@permission.errors.full_messages.to_s}" }
        format.json { head :no_content }
      end
    end
  end
end
