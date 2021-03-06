module Investors::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :city
    belongs_to :state
    belongs_to :investment_group
    belongs_to :consultant
    belongs_to :user
    has_many :schedules, as: :schedulable, dependent: :destroy
  end
end
