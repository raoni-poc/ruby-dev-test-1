# frozen_string_literal: true
class Folder < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :parent, class_name: "Folder", optional: true
  has_many :subfolders, class_name: "Folder", foreign_key: :parent_id, dependent: :destroy
  has_and_belongs_to_many :stored_files

  validates :name, presence: true,
            uniqueness: { scope: [:owner_id, :parent_id],
                          message: "Pasta já existe" }

  def self.find_by_path(path)
    names = path.split('/')
    current = nil
    names.each do |name|
      current = Folder.find_by(name: name, parent: current)
      return nil unless current
    end
    current
  end

  def update_path_cache
    self.path_cache = [parent&.path_cache, name].compact.join('/')
  end
end
