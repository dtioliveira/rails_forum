class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title_pt
      t.string :title_es
      t.text :text_pt
      t.text :text_es
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
