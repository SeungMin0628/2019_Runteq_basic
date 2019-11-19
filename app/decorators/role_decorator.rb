class RoleDecorator < ApplicationDecorator
  delegate_all

  def self.all_names
    Role.distinct.pluck(:name).map { |name| [I18n.t("roles.#{name}"), name] }
  end
end
