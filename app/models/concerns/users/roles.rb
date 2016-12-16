module Users::Roles
  extend ActiveSupport::Concern

  included do
    include RoleModel

    after_initialize :set_default_rol

    roles :admin, :cashier
  end

  def rol
    roles.first.to_s
  end

  private

    def set_default_rol
      self.roles << [:adviser] if roles.blank?
    end
end
