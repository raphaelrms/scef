class ChangeValorOnCustosToInteger < ActiveRecord::Migration
  def up
    change_table :custos do |t|
      t.change :valor, :integer
    end
  end

  def down
    change_table :fases do |t|
      t.change :valor, :float
    end
  end
end
