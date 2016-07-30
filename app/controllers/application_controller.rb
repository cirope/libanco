class ApplicationController < ActionController::Base
  include ActionTitle
  include Devise::StrongParameters

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit

  def after_sign_in_path_for resource
    users_url
  end
end
