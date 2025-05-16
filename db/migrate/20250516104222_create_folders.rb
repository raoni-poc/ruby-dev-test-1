class CreateFolders < ActiveRecord::Migration[8.0]
  def change
    create_table :folders do |t|
      t.string :name, null: false
      t.references :parent, foreign_key: { to_table: :folders }, index: true
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.text :description
      t.string :visibility, default: "private"

      t.datetime :deleted_at
      t.timestamps
    end
  end
end