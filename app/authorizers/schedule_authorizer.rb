class ScheduleAuthorizer < ApplicationAuthorizer
  def self.default adjective, user
    true
  end
end
