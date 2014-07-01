#encoding: utf-8
class RelatoriosController < ApplicationController

  def relatorio_fase_custos
  end

  def exporta_relatorio
    if params[:fase_id]==""
      @fase = Fase.all
    else
      @fase = Fase.where(:id=>params[:fase_id])
    end
    @custos_associados = Custo.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html {
      }
      format.pdf do
        render :pdf => "relatorio", :template => 'relatorios/exporta_relatorio.html.erb',:handlers => [:erb],:encoding => "utf8",:show_as_html => false,:disposition => 'attachment'
      end
    end

  end


end