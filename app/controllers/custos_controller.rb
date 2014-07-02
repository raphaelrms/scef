#encoding: utf-8
class CustosController < ApplicationController

  load_and_authorize_resource

  def index
    @custos = Custo.paginate(:page => params[:page], :per_page => 10)
    @custo_novo = Custo.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @custos }
    end
  end

  def show
    @custo = Custo.find(params[:id])
    respond_to do |format|
      format.html {}# show.html.erb
      format.json { render :json =>  @custo }
      format.pdf { render :pdf => "file_name" }
    end
  end

  def new
    @custo = Custo.new
    @categoria_nova = Categoria.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @custo }
    end
  end

  def edit
    @custo = Custo.find(params[:id])
  end

  def create
    params[:custo][:valor] = normaliza_valor(params[:custo][:valor])
    @custo = Custo.new(params[:custo])

    if @custo.save
      redirect_to :back, :notice => "Custo criado com sucesso"
    else
      redirect_to :back, :alert => "Não foi possível criar o custo. Erro: #{@custo.errors.full_messages.to_s}"
    end
  end

  def update
    @custo = Custo.find(params[:id])
    params[:custo][:valor] = normaliza_valor(params[:custo][:valor])
    if @custo.update_attributes(params[:custo])
      redirect_to custos_path, :notice => "Custo atualizado com sucesso"
    else
      #flash.now[:error] = "Não foi possível atualizar o custo da categoria #{@custo.descricao}. Erro: #{@custo.errors.full_message}"
      redirect_to custos_path
    end
  end

  def destroy
    @custo = Custo.find(params[:id])
    @custo.destroy
       .
    redirect_to custos_path, :notice => "Custo '#{@custo.id}' da fase '#{@custo.fase.descricao}' removido com sucesso."
  end

  def normaliza_valor(valor)
    valor.gsub('R$','').split('.').join.split(',').join.strip
  end
end
