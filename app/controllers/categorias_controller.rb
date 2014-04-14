class CategoriasController < ApplicationController

  load_and_authorize_resource

  def index
    @categoria_nova = Categoria.new
    @categorias = Categoria.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categoria }
    end
  end

  def new
    @categoria = Categoria.new
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def create
    binding.pry
    @categoria = Categoria.new(params[:categoria])

    if @categoria.save
      redirect_to categorias_path, :notice => "Categoria criada com sucesso"
    else
      redirect_to categorias_path, :alert => "Não foi possível criar a categoria '#{@categoria.descricao}'. Erro: #{@categoria.errors.full_message.to_s}"
    end
  end

  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update_attributes(params[:categoria])
      redirect_to categorias_path, :notice => "Categoria atualizada com sucesso"
    else
      redirect_to categorias_path, :alert => "Não foi possível atualizar a categoria '#{@categoria.descricao}'. Erro: #{@categoria.errors.full_message.to_s}"
    end
  end

  def destroy
    categoria = Categoria.find(params[:id])
    sem_categoria = Categoria.where(:descricao=>"SEM CATEGORIA").first
    @custos = Custo.where(:categoria_id=>categoria.id).first
    @custos.update_attributes(:categoria_id=>sem_categoria.id) unless @custos.nil?
    categoria.destroy
    redirect_to categorias_path, :notice => "Categoria '#{categoria.descricao}' removida."
  end
end
