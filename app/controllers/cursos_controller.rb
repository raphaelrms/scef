class CursosController < ApplicationController

  #before_filter :carregar_arquivos,       :only => [:new, :edit, :create, :show]

  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
  end

  def new
    @curso = Curso.new
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to cursos_path, :notice => "Curso \"#{@curso.nome}\" criado com sucesso." }
        format.json { render json =>@curso, status =>:created, location =>@curso }
      else
        format.html { render action: "new" }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @curso = Curso.find(params[:id])
    if @curso.update_attributes(params[:curso])
      redirect_to curso_path(@curso.id), :notice => "Curso atualizado com sucesso."
    else
      redirect_to curso_path(@curso.id), :alert => "Não foi possível atualizar o curso. Erro: #{@curso.errors.full_message.to_s}"
    end
  end

  def destroy
    #authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @curso = Curso.find(params[:id])
    @curso.destroy
    redirect_to cursos_path, :notice => "Curso '#{@curso.nome}' removido."
  end

  #def carregar_arquivos
  #  if (!params[:id].nil?)
  #    @curso = Curso.find(params[:id]) unless !@curso.nil?
  #    if @curso.arquivos.any?
  #      @arquivos = @curso.arquivos
  #    else
  #      @arquivos = [ @curso.arquivos.build ]
  #    end
  #  end
  #end
end
