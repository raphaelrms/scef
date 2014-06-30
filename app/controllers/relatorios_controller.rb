#encoding: utf-8
class RelatoriosController < ApplicationController

  def relatorio_fase_custos
  end

  def exporta_relatorio
    respond_to do |format|
      format.html {
        if params[:fase_id]==""
          @fase = Fase.all
        else
          @fase = Fase.where(:id=>params[:fase_id])
        end
        @custos_associados = Custo.paginate(:page => params[:page], :per_page => 5)
      }
      format.pdf do
        render :pdf => "relatorio.pdf", :layout => 'exporta_relatorio'
      end
    end

  end


end