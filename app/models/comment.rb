class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65535 }

  belongs_to :user
  belongs_to :board

  def owned_by?(user)
    user_id == user&.id
  end
end
