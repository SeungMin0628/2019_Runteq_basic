class Bookmark < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :board
  belongs_to :bookmarked_boards, class_name: :Board, foreign_key: :board_id
end
