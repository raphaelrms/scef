#encoding: utf-8
class AddUsersToNoticias < ActiveRecord::Migration
  def change
    add_column :noticias, :user_id, :integer, :limit => 11
    add_foreign_key(:noticias,:users)
  end
end
