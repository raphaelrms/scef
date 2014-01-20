class CategoriasController < ApplicationController

  def index
    @categorias = Categoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categorias }
    end
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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categoria }
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Categoria was successfully created.' }
        format.json { render json: @categoria, status: :created, location: @categoria }
      else
        format.html { render action: "new" }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        format.html { redirect_to @categoria, notice: 'Categoria was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to categorias_url }
      format.json { head :no_content }
    end
  end
end
