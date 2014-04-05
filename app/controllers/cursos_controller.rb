#encoding: utf-8
class CursosController < ApplicationController

  #before_filter :carregar_arquivos, :only => [:new, :edit, :create, :show]

  load_and_authorize_resource

  def index
    @cursos = Curso.all
  end

  def show
    binding.pry
    @curso = Curso.find(params[:id])
    @arquivos = @curso.arquivos
  end

  def new
    @curso = Curso.new
    @curso.arquivos.build
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to cursos_path, :notice => "Curso \"#{@curso.nome}\" criado com sucesso." }
        format.json { render :json =>@curso, status =>:created, :location =>@curso }
      else
        format.html { render :action => "new" }
        format.json { render :json => @curso.errors, :status => :unprocessable_entity }
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
    nome = @curso.nome
    respond_to do |format|
      if @curso.destroy
        format.html { redirect_to cursos_path, :notice => "Curso \"#{nome}\" removido com sucesso." }
        format.json { head :no_content }
      else
        format.html { redirect_to cursos_path, :alert => "Erro ao remover curso #{nome}: #{@curso.errors.full_messages.to_s}" }
        format.json { head :no_content }
      end
    end
  end

  def carregar_arquivos
    if (!params[:id].nil?)
      @curso = Curso.find(params[:id]) if !@curso.nil?
      if @curso.arquivos.any?
        @arquivos = @curso.arquivos
      else
        @arquivos = [ @curso.arquivos.build ]
      end
    end
  end

  def download
    #    authorize! :read, @arquivo
    @arquivo = Arquivo.find params[:id]
    send_file @arquivo.arquivo.path, :type=> @arquivo.arquivo.content_type, :x_sendfile=>true if @arquivo.arquivo.exists?
  end

end
