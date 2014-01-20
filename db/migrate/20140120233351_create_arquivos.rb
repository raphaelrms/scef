class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
      t.integer :curso_id, :null => false, :references => [:cursos, :id]
      t.string :descricao
      t.string :arquivo_file_name
      t.string :arquivo_content_type
      t.integer :arquivo_file_size
      t.datetime :arquivo_update_at
      t.timestamps
    end
  end
end