class User < ApplicationRecord
  authenticates_with_sorcery!
  before_save { self.email = email.downcase }
  mount_uploader :avatar, AvatarUploader

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :last_name, :first_name, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :boards, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_boards, through: :bookmarks, class_name: :Board
  has_many :comments, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  scope :recent, -> { order(id: :desc) }

  enum role: %i[general admin]

  def bookmark_for(board)
    bookmarks.find_by(board_id: board.id)
  end

  def has_role?(role_name)
    role == role_name.to_s
  end
end
