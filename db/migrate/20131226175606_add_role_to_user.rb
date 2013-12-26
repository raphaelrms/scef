class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, :limit => 11
    add_foreign_key(:users,:roles)
  end
end
