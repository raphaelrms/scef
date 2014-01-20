class CreateFases < ActiveRecord::Migration
  def change
    create_table :fases do |t|

      t.timestamps
    end
  end
end
