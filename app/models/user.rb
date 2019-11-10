class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!
  before_save { self.email = email.downcase }
  after_create :assign_default_role
  mount_uploader :avatar, AvatarUploader

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :last_name, :first_name, presence: true

  # Relations
  has_many :boards, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_boards, through: :bookmarks, class_name: :Board
  has_many :comments, dependent: :destroy

  # Scope
  scope :id_desc, -> { order(id: :desc)}

  def bookmark_for(board)
    bookmarks.find_by(board_id: board.id)
  end

  # PRIVATE methods

  private

  def assign_default_role
    self.add_role(:general) if self.roles.blank?
  end
end
