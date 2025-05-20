# frozen_string_literal: true

class FileRecord < ApplicationRecord
  has_and_belongs_to_many :folders
  has_one_attached :uploaded_file

  validates :uploaded_file, attached: true

  validate :must_be_unique_by_hash

  def must_be_unique_by_hash
    return unless sha256.present?

    if FileRecord.where(sha256: sha256).where.not(id: id).exists?
      errors.add(:uploaded_file, "já foi enviado anteriormente (hash duplicado)")
    end
  end
end
