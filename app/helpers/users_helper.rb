module UsersHelper
  def user_roles
    User.valid_roles.map { |r| [t("users.roles.#{r}"), User.mask_for(r)] }
  end
end
