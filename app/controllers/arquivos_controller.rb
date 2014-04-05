class ArquivosController < ApplicationController

  load_and_authorize_resource

  def show
    @arquivo = Arquivo.find params[:id]
    send_file @arquivo.arquivo.path, :type=>@arquivo.arquivo.content_type, :x_sendfile=>true, :disposition => 'inline',:stream => false
  end

  def destroy
    #authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @arquivo = Arquivo.find(params[:id])
    nome = @arquivo.arquivo_file_name
    @tipo = @arquivo.anexo
    respond_to do |format|
      if @arquivo.destroy
        format.html {
          if @tipo.is_a? Curso
            redirect_to curso_path(@tipo), :notice => "Arquivo \"#{nome}\" removido com sucesso."
          else
            redirect_to fase_path(@tipo), :notice => "Arquivo \"#{nome}\" removido com sucesso."
          end
        }
        format.json { render "destroy"}
      else
        format.html {
          if @tipo.is_a? Curso
            redirect_to curso_path(@tipo), :alert => "Erro ao remover arquivo #{nome}: #{@arquivo.errors.full_messages.to_s}"
          else
            redirect_to fase_path(@tipo), :alert => "Erro ao remover arquivo #{nome}: #{@arquivo.errors.full_messages.to_s}"
          end
        }
        format.json { head :no_content }
      end
    end
  end

end

def new
  @arquivo = Arquivo.new()
  @arquivo.assets.build
end