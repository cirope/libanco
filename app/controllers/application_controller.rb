class ApplicationController < ActionController::Base
  include ActionTitle
  include Devise::StrongParameters

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit

  def after_sign_in_path_for resource
    default_url
  end

  def current_tenant
    @_current_tenant ||= Account.find_by subdomain: Apartment::Tenant.current
  end

  def default_url
    if current_user.admin?
      cashes_url
    else
      new_cash_url
    end
  end
end
