# encoding: utf-8
class PermissionRoleController < ApplicationController
  load_and_authorize_resource


  def index
    @roles = Role.all
    @permissions = Permission.all
    @rb = PermissionRole.sem_redundancias

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @permission }
    end
  end

  # GET /Permission/1
  # GET /Permission/1.json
  def show
    @permission = Permission.find(params[:permission][:id])
    @role = Role.find(params[:role][:id])

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
      format.json { render :json => @permission }
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
        format.html { redirect_to roles_path, :notice => "Permissão #{@permission.name} criada com sucesso." }
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
        format.html { redirect_to @permission, :notice => "Permissão #{@permission.name} atualizada com sucesso."}
        format.json { head :no_content }
      else
        format.html { render :action =>"edit" }
        format.json { render json =>@permission.errors, status =>:unprocessable_entity }
      end
    end
  end

  def remove_permissao_ajax
    @role = Role.where(:id => params[:role_id]).first
    @permission = Permission.where(:id => params[:permission_id]).first
      respond_to do |format|
        if PermissionRole.where(:role_id => params[:role_id],:permission_id => params[:permission_id]).any?
          if @role.permissions.destroy(Permission.where(:id => params[:permission_id]).first).first.save
            format.json { head :no_content, status => :ok }
          else
            format.json { render json =>@role.errors, status =>:unprocessable_entity }
          end
        else
          #Se não existe, é sucesso
          format.json { head :no_content, status => :ok }
        end
    end

  end

  def adiciona_permissao_ajax
    @pr = PermissionRole.new(:role_id => params[:role_id],:permission_id => params[:permission_id])
    respond_to do |format|
      if @pr.save
        format.json { head :no_content, status => :ok }
      else
        format.json { render json =>@role.errors, status =>:unprocessable_entity }
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
