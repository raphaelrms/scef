class AddQtdadeToCustos < ActiveRecord::Migration
  def change
    add_column :custos, :quantidade, :integer
    add_column :custos, :dt_referencia, :date
  end
end
