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

end
