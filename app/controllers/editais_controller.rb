class EditaisController < ApplicationController

  def index
    @editais = Edital.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editais }
    end
  end

  def show
    @edital = Edital.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @edital }
    end
  end

  def new
    @edital = Edital.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @edital }
    end
  end

  def edit
    @edital = Edital.find(params[:id])
  end

  def create
    @edital = Edital.new(params[:edital])

    respond_to do |format|
      if @edital.save
        format.html { redirect_to @edital, notice: 'Edital was successfully created.' }
        format.json { render json: @edital, status: :created, location: @edital }
      else
        format.html { render action: "new" }
        format.json { render json: @edital.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @edital = Edital.find(params[:id])

    respond_to do |format|
      if @edital.update_attributes(params[:edital])
        format.html { redirect_to @edital, notice: 'Edital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @edital.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @edital = Edital.find(params[:id])
    @edital.destroy

    respond_to do |format|
      format.html { redirect_to editais_url }
      format.json { head :no_content }
    end
  end
end
