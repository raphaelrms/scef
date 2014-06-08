class RemoveCursoFromArquivos < ActiveRecord::Migration
  def up
    remove_column :arquivos, :curso_id
  end

  def down
    add_column :arquivos, :curso_id, :integer
  end
end
