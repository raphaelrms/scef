#encoding: utf-8
class FasesController < ApplicationController

  load_and_authorize_resource

  before_filter :carrega_dados, :only => [:index,:pesquisar]

  def index
    @fases = Fase.paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.html
      format.js { render :partial => 'fase_index' }
    end
  end

  def carrega_dados
    @fase_nova = Fase.new
    @cursos = Curso.ordenado_por_nome.all.collect { |u| [u.nome, u.id] }
  end

  def show
    @fase = Fase.find(params[:id])
    @custos_associados = Custo.paginate(:page => params[:page], :per_page => 5)
    @custo_total = @fase.custos.sum('valor*quantidade')
    @custo_excedido = @custo_total.to_i > @fase.orcamento.to_i ? true : false
    @valor_excedido = @custo_total.to_i - @fase.orcamento.to_i
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

  def pesquisar
    valor = params[:filtro].split('.').join.split(',').join

    #Busca por Datas
    if params[:inicio_periodo] || params[:fim_periodo]
       @fases = Fase.comecando(params[:inicio_periodo].to_date.to_s).scoped if !params[:inicio_periodo].blank?
       @fases = Fase.finalizando(params[:fim_periodo].to_date.to_s).scoped if !params[:fim_periodo].blank?
       @fases = @fases.paginate(:page => params[:page], :per_page => 2) if @fases.any?

    else
    #Busca por VALOR
    #Se for numero, procura no orcamento.
    if !(valor.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/)).nil?  && !valor.blank?
      binding.pry
      @fases = Fase.joins(:curso).where("fases.orcamento = ?",valor).paginate(:page => params[:page], :per_page => 2)
    #VALOR E DATAS em branco?! Então busco todos.
    elsif valor.blank? && (params[:inicio_periodo].blank? && params[:fim_periodo].blank?)
      binding.pry
      @fases = Fase.paginate(:page => params[:page], :per_page => 2)
    else
      #É um valor valido para procurar
      @fases = Fase.joins(:curso).where("cursos.nome like ? or fases.descricao like ?",'%'+valor+'%','%'+valor+'%').paginate(:page => params[:page], :per_page => 2)
    end

    end
    @termo = params[:filtro]
    respond_to do |format|
      format.html { render "index"}
    end


  end

end
