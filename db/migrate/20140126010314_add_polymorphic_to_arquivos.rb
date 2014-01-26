class AddPolymorphicToArquivos < ActiveRecord::Migration
  def up
    add_column :arquivos,  :anexo_id, :integer
    add_column :arquivos,  :anexo_type, :string
  end

  def down
      remove_column :arquivos,  :anexo_id
      remove_column :arquivos,  :anexo_type
  end
end
