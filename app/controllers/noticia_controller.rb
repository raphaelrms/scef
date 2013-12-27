class NoticiaController < ApplicationController
  load_and_authorize_resource

  # GET /noticia
  # GET /noticia.json


  def index
    @noticia = Noticia.all

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @noticia }
    end
  end

  # GET /noticia/1
  # GET /noticia/1.json
  def show
    @Noticia = Noticia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Noticia }
    end
  end

  # GET /noticia/new
  # GET /noticia/new.json
  def new
    @Noticia = Noticia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Noticia }
    end
  end

  # GET /noticia/1/edit
  def edit
    @Noticia = Noticia.find(params[:id])
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @Noticia = Noticia.new(params[:Noticia])

    respond_to do |format|
      if @Noticia.save
        format.html { redirect_to @Noticia, notice: 'Noticia was successfully created.' }
        format.json { render json: @Noticia, status: :created, location: @Noticia }
      else
        format.html { render action: "new" }
        format.json { render json: @Noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /noticia/1
  # PUT /noticia/1.json
  def update
    @Noticia = Noticia.find(params[:id])

    respond_to do |format|
      if @Noticia.update_attributes(params[:Noticia])
        format.html { redirect_to @Noticia, notice: 'Noticia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @Noticia = Noticia.find(params[:id])
    @Noticia.destroy

    respond_to do |format|
      format.html { redirect_to noticia_url }
      format.json { head :no_content }
    end
  end
end
