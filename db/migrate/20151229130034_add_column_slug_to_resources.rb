class AddColumnSlugToResources < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true

    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    add_column :videos, :slug, :string
    add_index :videos, :slug, unique: true
  end
end
