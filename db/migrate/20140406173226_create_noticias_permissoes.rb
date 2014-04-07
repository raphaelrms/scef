class CreateNoticiasPermissoes < ActiveRecord::Migration
    def change
      create_table :noticias_permissoes do |t|
        t.integer :noticia_id, :null => false
        t.integer :permissao, :null => false

        t.timestamps
      end
    end
end
