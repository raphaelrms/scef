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
      format.html # show.html.erb
      format.json { render :json =>  @custo }
    end
  end

  def new
    @custo = Custo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @custo }
    end
  end

  def edit
    @custo = Custo.find(params[:id])
  end

  def create
    @custo = Custo.new(params[:custo])

    if @custo.save
      redirect_to custos_path, :notice => "Custo criado com sucesso"
    else
      redirect_to custos_path, :alert => "Não foi possível criar o custo. Erro: #{@custo.errors.full_message.to_s}"
    end
  end

  def update
    @custo = Custo.find(params[:id])
    if @custo.update_attributes(params[:custo])
      redirect_to custos_path, :notice => "Custo atualizado com sucesso"
    else
      redirect_to custos_path, :alert => "Não foi possível atualizar o custo da categoria '#{@custo.categoria.descricao}'. Erro: #{@custo.errors.full_message.to_s}"
    end
  end

  def destroy
    @custo = Custo.find(params[:id])
    @custo.destroy

    respond_to do |format|
      format.html { redirect_to custos_url }
      format.json { head :no_content }
    end
  end
end
