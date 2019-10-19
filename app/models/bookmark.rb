class Bookmark < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :board
end
