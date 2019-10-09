class Board < ApplicationRecord
  # Validations
  validates :title, confirmation: true, length: { maximum: 255 }
  validates :body, confirmation: true, length: { maximum: 65535 }

  # Relations
  belongs_to :user
end
