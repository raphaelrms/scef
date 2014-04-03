#encoding: utf-8
class FasesController < ApplicationController

  load_and_authorize_resource

  def index
    @fases = Fase.paginate(:page => params[:page], :per_page => 5)
    @fase_nova = Fase.new
    @cursos = Curso.ordenado_por_nome.all.collect { |u| [u.nome, u.id] }
    respond_to do |format|
      format.html
      format.js { render :partial => 'fase_index' }
    end
  end

  def show
    @fase = Fase.find(params[:id])
    @custos_associados = @fase.custos.paginate(:page => params[:page], :per_page => 5)
    @custo_excedido = @fase.custos.sum('valor') > @fase.orcamento ? true : false
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fase }
    end
  end

  def new
    @fase = Fase.new

  end

  def edit
    @fase = Fase.find(params[:id])
  end

  def create
    #Não consegui achar forma melhor de tirar o
    params[:fase][:orcamento] = params[:fase][:orcamento].split('.').join.split(',').join
    @fase = Fase.new(params[:fase])
    if @fase.save
      redirect_to fases_path, :notice => "Fase criada com sucesso"
    else
      redirect_to fases_path, :alert => "Não foi possível criar a fase '#{@fase.descricao}'. Erro: #{@fase.errors.full_message.to_s}"
    end
  end

  def update
    @fase = Fase.find(params[:id])
    params[:fase][:orcamento] = params[:fase][:orcamento].split('.').join.split(',').join
    if @fase.update_attributes(params[:fase])
      redirect_to fases_path, :notice => "Fase atualizada com sucesso"
    else
      redirect_to fases_path, :alert => "Não foi possível atualizar a fase '#{@fase.descricao}'. Erro: #{@fase.errors.full_message.to_s}"
    end
  end

  def destroy

    fase = Fase.find(params[:id])

    fase.destroy
    redirect_to fases_path, :notice => "Fase '#{fase.descricao}' removida."

  end

end
