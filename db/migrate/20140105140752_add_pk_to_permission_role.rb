class AddPkToPermissionRole < ActiveRecord::Migration
  def change
    add_column :permissions_roles, :id, :primary_key
  end
end
