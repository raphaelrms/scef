class ArquivosController < ApplicationController

  def index
    @arquivos = Arquivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arquivos }
    end
  end

  def show
    @arquivo = Arquivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arquivo }
    end
  end

  def new
    @arquivo = Arquivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arquivo }
    end
  end

  def edit
    @arquivo = Arquivo.find(params[:id])
  end

  def create
    @arquivo = Arquivo.new(params[:arquivo])

    respond_to do |format|
      if @arquivo.save
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully created.' }
        format.json { render json: @arquivo, status: :created, location: @arquivo }
      else
        format.html { render action: "new" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @arquivo = Arquivo.find(params[:id])

    respond_to do |format|
      if @arquivo.update_attributes(params[:arquivo])
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @arquivo = Arquivo.find(params[:id])
    @arquivo.destroy

    respond_to do |format|
      format.html { redirect_to editais_url }
      format.json { head :no_content }
    end
  end
end
