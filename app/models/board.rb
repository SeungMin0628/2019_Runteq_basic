class Board < ApplicationRecord
  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

  # Relations
  belongs_to :user

  # Scopes
  scope :search, ->(keyword) { where(['title LIKE ?', "%#{keyword}%"]) }
  scope :recent, -> { order(created_at: :desc) }
end
