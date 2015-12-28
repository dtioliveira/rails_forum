class AddColumnTagToPublications < ActiveRecord::Migration
  def change
    add_column :posts, :tags, :string
    add_column :videos, :tags, :string
  end
end
