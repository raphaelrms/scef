class CursosController < ApplicationController

  def index
    @cursos = Curso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cursos }
    end
  end

  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @curso }
    end
  end

  def new
    @curso = Curso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @curso }
    end
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: 'Curso was successfully created.' }
        format.json { render json: @curso, status: :created, location: @curso }
      else
        format.html { render action: "new" }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        format.html { redirect_to @curso, notice: 'Curso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to cursos_url }
      format.json { head :no_content }
    end
  end
end
