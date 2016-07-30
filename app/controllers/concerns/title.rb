module Title
  extend ActiveSupport::Concern

  included do
    before_action :set_title, except: [:destroy]
  end
end
