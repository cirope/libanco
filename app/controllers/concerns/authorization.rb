module Authorization
  extend ActiveSupport::Concern

  included do
    authorize_actions_for controller_name.classify.constantize
    ensure_authorization_performed
  end
end
