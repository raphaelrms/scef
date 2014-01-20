class CreateEditais < ActiveRecord::Migration
  def change
    create_table :editais do |t|

      t.timestamps
    end
  end
end
