module Devise::StrongParameters
  extend ActiveSupport::Concern

	included do
  	before_action :configure_permitted_parameters, if: :devise_controller?
	end

  private

		def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :lastname, :email, :password, :password_confirmation, :current_password)
      end
    end
end
