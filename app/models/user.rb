class User < ApplicationRecord
  authenticates_with_sorcery!
  # before_save { self.email = email.downcase }

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :last_name, :first_name, presence: true

  # Relations
  has_many :bookmarks, dependent: :destroy
  has_many :boards, dependent: :destroy, through: :bookmarks
  has_many :comments, dependent: :destroy

  def bookmarked?(board)
    bookmarks.find_by(board_id: board.id)
  end
end
