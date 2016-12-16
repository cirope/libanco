class ApplicationAuthorizer < Authority::Authorizer
  def self.default adjective, user
    user.admin?
  end

  def self.authorizes_to_list_menu_admin? user, options = {}
    user.admin?
  end
end
