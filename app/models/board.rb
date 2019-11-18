class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

  # Relations
  has_many :bookmarks
  has_many :comments, dependent: :destroy
  belongs_to :user

  # Scopes
  scope :recent, -> { order(created_at: :desc) }

  # Instance method
  def owned_by?(user)
    user_id == user&.id
  end
end
