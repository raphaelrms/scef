class CreatePermissionsRoles < ActiveRecord::Migration
  def change
    create_table(:permissions_roles, :id => false) do |t|
      t.references :role
      t.references :permission
    end
  end
end
