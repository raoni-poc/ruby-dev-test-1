# frozen_string_literal: true

class FileRecordSerializer < ApplicationSerializer

  set_type :file_record
  set_id :id

  attributes :description, :sha256, :created_at, :updated_at

  attribute :filename do |object|
    object.uploaded_file.blob.filename.to_s if object.uploaded_file.attached?
  end

  attribute :content_type do |object|
    object.uploaded_file.blob.content_type if object.uploaded_file.attached?
  end

  attribute :byte_size do |object|
    object.uploaded_file.blob.byte_size if object.uploaded_file.attached?
  end
end
