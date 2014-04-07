class RemovePermissaoFromNoticiaPermissao < ActiveRecord::Migration
  def change
    remove_column :noticias_permissoes, :permissao
  end
end
