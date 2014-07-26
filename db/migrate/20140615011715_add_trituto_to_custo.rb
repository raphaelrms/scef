class AddTritutoToCusto < ActiveRecord::Migration
  def change
    add_column :custos, :tributo, :integer
  end
end
