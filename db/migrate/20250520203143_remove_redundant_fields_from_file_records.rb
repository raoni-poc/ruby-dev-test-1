class RemoveRedundantFieldsFromFileRecords < ActiveRecord::Migration[8.0]
  def change
    remove_column :file_records, :original_name, :string
    remove_column :file_records, :original_mime_type, :string
    remove_column :file_records, :size, :bigint
  end
end
