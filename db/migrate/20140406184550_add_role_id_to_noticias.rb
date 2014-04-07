class AddRoleIdToNoticias < ActiveRecord::Migration
  def change
    add_column :noticias_permissoes, :role_id, :integer
    add_foreign_key(:noticias_permissoes,:roles)
  end
end
