# frozen_string_literal: true

class FileRecordSerializer < ApplicationSerializer

  set_type :file_record
  set_id :id

  attributes :original_name, :original_mime_type, :size, :description, :sha256, :created_at, :updated_at
end
