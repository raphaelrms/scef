class RolesController < ApplicationController
  load_and_authorize_resource


  def index
    @role = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @role }
    end
  end

  # GET /Role/1
  # GET /Role/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>@role }
    end
  end

  # GET /Role/new
  # GET /Role/new.json
  def new
    @role = Role.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>@role }
    end
  end

  # GET /Role/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /Role
  # POST /Role.json
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, :notice => "Grupo #{@role.name} criado com sucesso." }
        format.json { render json =>@role, status =>:created, location =>@role }
      else
        format.html { render :action =>"new" }
        format.json { render json =>@role.errors, status =>:unprocessable_entity }
      end
    end
  end

  # PUT /Role/1
  # PUT /Role/1.json
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to @role, :notice => "Grupo #{@role.name} atualizado com sucesso."}
        format.json { head :no_content }
      else
        format.html { render :action =>"edit" }
        format.json { render json =>@role.errors, status =>:unprocessable_entity }
      end
    end
  end

  # DELETE /Role/1
  # DELETE /Role/1.json
  def destroy
    @role = Role.find(params[:id])
    nome = @role.name
    respond_to do |format|
      if @role.destroy
        format.html { redirect_to roles_path, :notice => "Grupo #{nome} removido com sucesso." }
        format.json { head :no_content }
      else
        format.html { redirect_to roles_path, :alert => "Erro ao remover grupo #{nome}: #{@role.errors.full_messages.to_s}" }
        format.json { head :no_content }
      end
    end
  end

  def associar_permissao
    @permissions = Permission.all
    @roles = Role.all
    @rb = PermissionRole.all

  end


end
