class LockAuthorizer < ApplicationAuthorizer
  def self.updatable_by? user
    true
  end

  def self.deletable_by? user
    user.admin?
  end
end
