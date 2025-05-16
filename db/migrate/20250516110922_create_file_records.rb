class CreateFileRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :file_records do |t|
      t.string :original_name, null: false
      t.string :original_mime_type
      t.bigint :size
      t.text :description
      t.string :sha256

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :file_records, :sha256, unique: true
  end
end
