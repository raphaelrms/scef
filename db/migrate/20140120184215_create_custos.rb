class CreateCustos < ActiveRecord::Migration
  def change
    create_table :custos do |t|
      t.float :valor
      t.integer :categoria_id, :null => false, :references => [:categorias, :id]
      t.integer :fase_id, :null => false, :references => [:fases, :id]
      t.timestamps
    end
  end
end
