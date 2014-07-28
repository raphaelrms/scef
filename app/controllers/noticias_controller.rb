# coding: UTF-8
class NoticiasController < ApplicationController

  load_and_authorize_resource

  def index
    if params[:tag].blank?
      @noticias = Noticia.paginate(:page => params[:page])
    else
      @noticias = Noticia.com_tag(params[:tag]).paginate(:page => params[:page])
    end
    render "application/home"
  end

  def feed
    if params[:search].blank?
      @noticias = []
    else
      pesquisa = params[:search].gsub(" ", "%")
      @noticias = Noticia.com_tag(pesquisa)
    end
    render :xml => @noticias.to_xml
  end

  def buscar_tag
    pesquisa = Noticia.pesquisar_tag(params[:q])
    render :json => pesquisa.to_json
  end

  def new
    @noticia = Noticia.new
    @roles = Role.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @custo }
    end
  end

  def create
    @noticia = Noticia.new(params[:noticia])
    @noticia.user = current_user
    if @noticia.save
      redirect_to root_path, :notice => "Notícia criada com sucesso."
    else
      @roles = Role.all
      flash[:error] = "Nãoo foi posível criar notícia."
      @erros = @noticia.errors.messages.collect{|k,v|v[0]}
      render :new
    end
  end

  def show
    @noticia = Noticia.find(params[:id])
  end

  def edit
    @noticia = Noticia.find(params[:id])
    @roles = Role.all

  end

  def update
    @noticia = Noticia.find(params[:id])
    if @noticia.update_attributes(params[:noticia])
      redirect_to root_path, :notice => "Notícia atualizada."
    else
      flash[:error] = @noticia.errors
      render :edit
    end
  end

  def like
    @noticia.liked_by sessao_atual
    respond_to do |format|
      format.js
    end
  end

  def dislike
    @noticia.disliked_by sessao_atual
    respond_to do |format|
      format.js
    end
  end

  def remover_voto
    if sessao_atual.voted_up_on? @noticia
      @noticia.unliked_by sessao_atual
    else
      @noticia.undisliked_by sessao_atual
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @noticia.destroy
    redirect_to root_path, :notice => "Notícia removida."
  end

  def criar_comentario
    comentario = Comentario.new(:vinculacao_id => params[:vinculacao_id], :noticia_id => params[:noticia_id], :corpo => params[:corpo])
    @noticia.comentarios << comentario
    if comentario.save
      flash[:notice] = "Comentario salvo."
      redirect_to @noticia
    else
      flash[:error] = "Por favor, preencha o formulÃ¡rio."
      redirect_to @noticia
    end
  end

  private

  def carregar_noticia
    if params[:id].blank?
      @noticia = Noticia.new
    else
      @noticia = Noticia.find(params[:id])
    end
  end
end