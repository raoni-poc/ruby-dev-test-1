class Files < ActiveRecord::Migration[8.0]
  def change
    create_table :files do |t|
      t.string :original_name, null: false
      t.string :original_mime_type
      t.bigint :size
      t.references :folder, foreign_key: true
      t.text :description
      t.string :visibility, default: "private"

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
