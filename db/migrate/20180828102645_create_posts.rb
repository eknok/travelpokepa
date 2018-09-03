class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :party
      t.text :comment
      t.string :favorite
      t.integer :game, default: 0, null: false, limit: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
