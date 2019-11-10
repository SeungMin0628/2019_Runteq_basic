class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
            polymorphic: true,
            optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify

  # Class Method
  def self.all_names
    all.map { |role| [I18n.t("roles.#{role.name}"), role.name] }
  end
end
