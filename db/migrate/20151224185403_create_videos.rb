class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title_pt
      t.string :title_es
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
