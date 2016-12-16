class CashAuthorizer < ApplicationAuthorizer
  def self.default able, user
    user.admin?
  end

  def self.readable_by? user
    true
  end

  def self.creatable_by? user
    true
  end
end
