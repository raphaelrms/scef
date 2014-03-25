#encoding: utf-8
class CustosController < ApplicationController

  load_and_authorize_resource

  def index
    @custos = Custo.joins(:fase,:categoria).all

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

    respond_to do |format|
      if @custo.save
        format.html { redirect_to @custo, :notice =>  'Custo was successfully created.' }
        format.json { render :json =>  @custo, :status =>   :created, :location =>  @custo }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @custo.errors, :status =>   :unprocessable_entity }
      end
    end
  end

  def update
    @custo = Custo.find(params[:id])

    respond_to do |format|
      if @custo.update_attributes(params[:custo])
        format.html { redirect_to @custo, :notice =>  'Custo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @custo.errors, :status =>   :unprocessable_entity }
      end
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
