class FasesController < ApplicationController

  def index
    @fases = Fase.all

    @cursos = Curso.ordenado_por_nome.all.collect { |u| [u.nome, u.id] }
  end

  def show
    @fase = Fase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fase }
    end
  end

  def new
    @fase = Fase.new
  end

  def edit
    @fase = Fase.find(params[:id])
  end

  def create
    @fase = Fase.new(params[new_fase_path])

    if @fase.save
      redirect_to fases_path, :notice => "Fase criada com sucesso"
    else
      redirect_to fases_path, :alert => "Não foi possível criar a fase '#{@fase.descricao}'. Erro: #{@fase.errors.full_message.to_s}"
    end
  end

  def update
    #authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @fase = Fase.find(params[:id])
    if @fase.update_attributes(params[:categoria])
      redirect_to fases_path, :notice => "Fase atualizada com sucesso"
    else
      redirect_to fases_path, :alert => "Não foi possível atualizar a fase '#{@fase.descricao}'. Erro: #{@fase.errors.full_message.to_s}"
    end
  end

  def destroy
    #authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    fase = Fase.find(params[:id])
    fase.destroy
    redirect_to fases_path, :notice => "Fase '#{fase.descricao}' removida."
  end
end
