class Cash < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Cashes::Balance
  include Cashes::Defaults
  include Cashes::Relations
  include Cashes::Scopes
  include Cashes::Validation
end
