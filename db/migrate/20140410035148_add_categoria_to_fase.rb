class AddCategoriaToFase < ActiveRecord::Migration
  def change
    add_column :categorias, :observacoes, :string
  end
end
