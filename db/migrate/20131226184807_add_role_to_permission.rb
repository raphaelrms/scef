class AddRoleToPermission < ActiveRecord::Migration
    def change
      add_column :permissions, :role_id, :integer
      add_foreign_key(:permissions,:roles)
    end
end
