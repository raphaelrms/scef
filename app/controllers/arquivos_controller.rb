class ArquivosController < ApplicationController

  load_and_authorize_resource :except => :show

  def show
    @arquivo = Arquivo.find params[:id]
    send_file @arquivo.arquivo.path, :type=>@arquivo.arquivo.content_type, :x_sendfile=>true, :disposition => 'inline',:stream => false
  end

end

def new
  @arquivo = Arquivo.new()
  @arquivo.assets.build
end