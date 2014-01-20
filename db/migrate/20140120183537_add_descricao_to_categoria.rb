class AddDescricaoToCategoria < ActiveRecord::Migration
  def change
    add_column :categorias, :descricao, :string
  end
end
