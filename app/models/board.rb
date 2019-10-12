class Board < ApplicationRecord
  attr_accessor :board_image_cache
  mount_uploader :board_image, BoardImageUploader

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }
  validates :board_image, presence: true

  # Relations
  belongs_to :user

  # Scopes
  scope :search, ->(keyword) { where(['title LIKE ?', "%#{keyword}%"]) }
  scope :recent, -> { order(created_at: :desc) }
end
