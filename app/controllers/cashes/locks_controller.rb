class Cashes::LocksController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  authorize_actions_for LockAuthorizer
  ensure_authorization_performed

  def update
    @cash.lock!

    if current_user.admin?
      redirect_to cashes_url
    else
      sign_out current_user
      redirect_to root_url
    end
  end

  def destroy
    @cash.unlock!
    redirect_to cash_flows_url(@cash)
  end
end
