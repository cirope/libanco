class HeaderTemplateAuthorizer < ApplicationAuthorizer
  def self.default adjective, user
    user.admin?
  end
end
