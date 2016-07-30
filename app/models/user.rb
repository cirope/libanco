class User < ApplicationRecord
  include Authority::Abilities
  include Authority::UserAbilities
  include Attributes::Strip
  include Auditable
  include CurrentAccount
  include Users::Relations
  include Users::Roles
  include Users::Validation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  strip_fields :name, :lastname, :email

  def to_s
    [name, lastname].join ' '
  end
end
