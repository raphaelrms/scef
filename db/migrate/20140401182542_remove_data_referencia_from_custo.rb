class RemoveDataReferenciaFromCusto < ActiveRecord::Migration
  def up
    remove_column :custos, :data_referencia
  end

  def down
    add_column :custos, :data_referencia, :date
  end
end
