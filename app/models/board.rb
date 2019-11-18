class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

  has_many :bookmarks
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  # Instance method
  def owned_by?(user)
    user_id == user&.id
  end
end
