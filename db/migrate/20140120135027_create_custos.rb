class CreateCustos < ActiveRecord::Migration
  def change
    create_table :custos do |t|

      t.timestamps
    end
  end
end
