class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      # A differently-named reference: the column is commenter_id but it points
      # at the authors table — slash_migrate shows this as "foreign key (authors)".
      t.references :commenter, null: false, foreign_key: {to_table: :authors}
      t.text :body, null: false
      t.boolean :approved, null: false, default: false

      t.timestamps
    end
  end
end
