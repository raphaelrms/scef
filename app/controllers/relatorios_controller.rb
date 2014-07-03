#encoding: utf-8
class RelatoriosController < ApplicationController

  def relatorio_fase_custos
  end

  def exporta_relatorio
    if params[:fase_id]==""
      @fase = Fase.all
      template = 'relatorios/exporta_relatorio_fases.html.erb'
    else
      @fase = Fase.where(:id=>params[:fase_id])
      template = 'relatorios/exporta_relatorio_fase_especifica.html.erb'
    end
    respond_to do |format|
      format.html {
      }
      format.pdf do
        render :pdf => "relatorio", :template => template,:handlers => [:erb],:encoding => "utf8",:show_as_html => false,:disposition => 'attachment'
      end
    end

  end


end