class AddConditionToPermissions < ActiveRecord::Migration
    def change
      add_column :permissions, :condition, :string
    end
end
