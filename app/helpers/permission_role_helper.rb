module PermissionRoleHelper
  def nome_acao(acao)
    case acao
      when "new"
        then "Criar"
      when "index"
        then "Acessar"
      when "manage"
        then "Acesso completo"
      when "edit"
        then "Editar"
      when "read"
        then "Visualizar"
      when "destroy"
        then "Remover"

    end

  end
end