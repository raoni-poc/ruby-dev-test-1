# frozen_string_literal: true

module FileRecords
  class CreateService < ApplicationService
    def call
      uploaded_file = @params[:file]
      return unless uploaded_file.respond_to?(:read)

      file_data = uploaded_file.read
      uploaded_file.rewind

      sha256 = Digest::SHA256.hexdigest(file_data)
      uploaded_file.rewind

      existing = FileRecord.find_by(sha256: sha256)

      # folder = Folder.first
      #
      # if existing.present?
      #   folder << existing
      #   return existing
      # end

      file_record = FileRecord.new(
        description: @params[:description],
        sha256: sha256
      )

      file_record.uploaded_file.attach(uploaded_file)
      file_record.save
      file_record
    end
  end
end
