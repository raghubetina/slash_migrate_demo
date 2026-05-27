class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.references :author, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :view_count, null: false, default: 0
      t.bigint :legacy_id
      t.decimal :rating, precision: 3, scale: 2
      t.float :reading_time
      t.boolean :published, null: false, default: false
      t.datetime :published_at

      t.timestamps
    end
    add_index :posts, :title
  end
end
