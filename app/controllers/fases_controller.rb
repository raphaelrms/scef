class FasesController < ApplicationController

  def index
    @fases = Fase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fases }
    end
  end

  def show
    @fas = Fase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fas }
    end
  end

  def new
    @fas = Fase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fas }
    end
  end

  def edit
    @fas = Fase.find(params[:id])
  end

  def create
    @fas = Fase.new(params[:fas])

    respond_to do |format|
      if @fas.save
        format.html { redirect_to @fas, notice: 'Fase was successfully created.' }
        format.json { render json: @fas, status: :created, location: @fas }
      else
        format.html { render action: "new" }
        format.json { render json: @fas.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fas = Fase.find(params[:id])

    respond_to do |format|
      if @fas.update_attributes(params[:fas])
        format.html { redirect_to @fas, notice: 'Fase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fas.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fas = Fase.find(params[:id])
    @fas.destroy

    respond_to do |format|
      format.html { redirect_to fases_url }
      format.json { head :no_content }
    end
  end
end
