class CreateDataDeReferenciaOnCusto < ActiveRecord::Migration
  def change
    add_column :custos, :data_referencia, :date
  end
end
