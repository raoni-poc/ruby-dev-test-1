class FileRecord < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :folders
  has_one_attached :zip

  validates :original_name, presence: true
  validates :original_mime_type, presence: true

  validate :zip_must_be_a_zip_file
  validate :must_be_unique_by_hash, on: :create

  def zip_must_be_a_zip_file
    return unless zip.attached?

    allowed_types = ["application/zip", "application/x-zip-compressed", "multipart/x-zip"]
    unless allowed_types.include?(zip.content_type)
      errors.add(:zip, "deve ser um arquivo ZIP")
    end
  end
  def must_be_unique_by_hash
    return unless sha256.present?

    if FileRecord.exists?(sha256: sha256)
      errors.add(:zip, "já foi enviado anteriormente (hash duplicado)")
    end
  end
end
