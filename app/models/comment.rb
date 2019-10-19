class Comment < ApplicationRecord
  # Validations
  validates :body, presence: true, length: { maximum: 65535 }

  # Relations
  belongs_to :user
  belongs_to :board

  # Instance method
  def owned_by?(user)
    user_id == user&.id
  end
end