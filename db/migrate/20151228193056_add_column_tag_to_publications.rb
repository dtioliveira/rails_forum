class AddColumnTagToPublications < ActiveRecord::Migration
  def change
    add_column :posts, :tags_pt, :string
    add_column :posts, :tags_es, :string
    add_column :videos, :tags_pt, :string
    add_column :videos, :tags_es, :string
  end
end
