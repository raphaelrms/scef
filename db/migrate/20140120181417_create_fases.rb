class CreateFases < ActiveRecord::Migration
  def change
    create_table :fases do |t|
      t.string :descricao
      t.integer :curso_id, :null => false, :references => [:cursos, :id]
      t.float :orçamento
      t.timestamps
    end
  end
end
