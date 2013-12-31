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
    return '<a href="#" title="'+mensagem+'" class="tooltipa"><span title="More" class="glyphicon glyphicon-exclamation-sign">&nbsp</span></a>'.html_safe
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
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        case type
          when "notice"
            messages += "<p class=\"alert alert-info\" style=\"text-align: center;\"><a href=\"#\" class=\"alert-link\">#{flash[type]}</a></p>"
          when "info"
            messages += "<p class=\"alert alert-info\" style=\"text-align: center;\"><a href=\"#\" class=\"alert-link\">#{flash[type]}</a></p>"
          when "warning"
            messages += "<p class=\"alert alert-warning\" style=\"text-align: center;\"><a href=\"#\" class=\"alert-link\">#{flash[type]}</a></p>"
          when "error"
            messages += "<p class=\"alert alert-danger\" style=\"text-align: center;\"><a href=\"#\" class=\"alert-link\">#{flash[type]}</a></p>"
          else
            messages += "<p class=\"alert alert-warning\" style=\"text-align: center;\"><a href=\"#\" class=\"alert-link\">#{flash[type]}</a></p>"
        end

      end
    }

    messages
  end
end

def exibe_erros(objeto)
  if objeto.errors.any?
       objeto.errors.full_messages.each do |e|
         return "<div style=\"color:red;\">Ocorreram os erros: </div><ul class=\"lista_erros\" style=\"\"><li style=\"margin-left:-10px;font-align: center;\">" + e.to_s + "</li></ul>".html_safe
        end
  end
end