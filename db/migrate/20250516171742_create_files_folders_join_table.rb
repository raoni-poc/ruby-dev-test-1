class CreateFilesFoldersJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :file_records, :folders do |t|
      t.index :file_record_id
      t.index :folder_id
    end
  end
end
