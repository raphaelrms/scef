# encoding: utf-8
module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def painel_titulo(titulo = nil)
    return '<div class="panel panel-default">
  <div class="panel-heading" style="background-color: #6B8AB2;">
    <h3 class="panel-title" style="color: white;">' + titulo + '</h3>
  </div>'.html_safe
  end

  def tooltip(mensagem = nil)
    return '<a href="#" title="'+mensagem+'" class="tooltipa"><div title="More" class="glyphicon glyphicon-exclamation-sign">&nbsp</div></a>'.html_safe
  end

  #bacalhau pro devise funcionar o edit decentemente
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_message
    messages = ""
    [:notice, :alert, :success,:info, :warning, :error].each {|type|
      if flash[type]
        case type.to_s
          when "notice"
            messages += "<p class=\"alert alert-success alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
          when "info"
            messages += "<p class=\"alert alert-info alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
          when "warning"
            messages += "<p class=\"alert alert-warning alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
          when "error"
            messages += "<p class=\"alert alert-danger alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
          when "alert"
            messages += "<p class=\"alert alert-danger alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
          else
            messages += "<p class=\"alert alert-warning alert-dismissable\" style=\"text-align: center;\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>#{flash[type]}</strong></p>"
        end

      end
    }

    messages
  end
end

def exibe_erros(objeto)
  erro = []
  if objeto.errors.any?
    erro = "<div style=\"color:#D63301;\">Verifique os erros abaixo: </div><ul class=\"lista_erros\" style=\"\">"
    objeto.errors.each do |e,f|
      erro << "<li style=\"margin-left:-10px;font-align: center;\">" + objeto.class.human_attribute_name(e.to_s) + " " + f.to_s + "</li>"
    end
  end
  erro << "</ul>"
  return erro.html_safe
end

def nome_barra
  return "<i class=\"glyphicon glyphicon-user\" style=\"margin-right:5px;;margin-left: 110px\"></i>"
end

def nome_acao(acao)
  case acao
    when "new"
    then "Criar"
    when "index"
    then "Listar"
    when "manage"
    then "Acesso completo"
    when "edit"
    then "Editar"
    when "update"
    then "Atualizar"
    when "read"
    then "Visualizar"
    when "destroy"
    then "Remover"
    when "create"
    then "Criar"
    else
      acao.to_s
  end
end

def normaliza_entidades(entidade)
  case entidade
    when "User"
    then "Usuários"
    when "all"
    then "Tudo"
    when "Role"
    then "Grupo"
    when "Permission"
    then "Permissões"
    else
      entidade.to_s
  end
end


def nome_abreviado(nome)
  return nome.split(' ').first + ' ' + nome.split(' ').last
end