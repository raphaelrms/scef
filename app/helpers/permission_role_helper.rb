# encoding: utf-8
module PermissionRoleHelper
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
      when "read"
        then "Visualizar"
      when "destroy"
        then "Remover"
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
        then "Permissão"
      else
        entidade
    end
  end
end