class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :bio
      t.integer :age
      t.boolean :active, null: false, default: true
      t.date :born_on

      t.timestamps
    end
    add_index :authors, :email, unique: true
  end
end
