class Cashes::LocksController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  authorize_actions_for LockAuthorizer
  ensure_authorization_performed

  def update
    @cash.closed_at ||= Time.zone.now

    parameters = params[:cash] ? cash_params : {}

    if @cash.update parameters.merge(status: 'closed')
      if current_user.admin?
        redirect_to cashes_url
      else
        sign_out current_user
        redirect_to root_url
      end
    else
      @cash.assign_attributes status: 'opened', closed_at: nil
      render 'cashes/show'
    end
  end

  def destroy
    @cash.unlock!
    redirect_to cash_flows_url(@cash)
  end

  private

    def cash_params
      params.require(:cash).permit :comment
    end
end
