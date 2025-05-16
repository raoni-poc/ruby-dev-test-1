class Folder < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :parent, class_name: "Folder", optional: true
  has_and_belongs_to_many :stored_files

  validates :name, presence: true,
            uniqueness: { scope: [:owner_id, :parent_id],
                          message: "Pasta já existe" }
end
