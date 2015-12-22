class AddColumnIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :access_level, :integer, default: 0
  end
end
