class AddColumnIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :status, :string, default: 'active'
    add_column :users, :avatar, :string
  end
end
