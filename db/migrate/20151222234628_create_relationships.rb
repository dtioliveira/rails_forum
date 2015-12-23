class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :adder_id
      t.integer :added_id
      t.string :situation

      t.timestamps null: false
    end
  end
end
