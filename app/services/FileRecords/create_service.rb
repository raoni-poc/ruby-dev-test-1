# frozen_string_literal: true

module FileRecords
  class CreateService < ApplicationService
    attr_reader :params, :zip_file, :file_record

    def initialize(params, zip_file, folder)
      @folder = folder
      @params = params
      @zip_file = zip_file
    end

    def call
      return unless zip_file.respond_to?(:read)

      sha256 = Digest::SHA256.hexdigest(zip_file.read)
      zip_file.rewind

      params[:sha256] = sha256

      existing = FileRecord.find_by(sha256: sha256)

      if existing.present?
        folder << existing
        return
      end

      file_record = FileRecord.new(params)
      file_record.zip.attach(
        io: zip_file,
        filename: "file.zip",
        content_type: "application/zip"
      )
      file_record.save ? file_record : nil
    end
  end
end
